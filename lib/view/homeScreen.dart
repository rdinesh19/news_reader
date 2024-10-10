import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_reader/view/widgets/card/articleListCard.dart';
import 'package:news_reader/view/widgets/emptyDataWidget.dart';
import 'package:news_reader/view/widgets/errorWidget.dart';
import 'package:news_reader/view/widgets/loadingWidget.dart';
import 'package:news_reader/view/widgets/noInternet.dart';
import '../component/check_internet_connection.dart';
import '../constant/colors.dart';
import '../providers/news_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String _selectedCountryName = 'in'; // Default selection (United States)
  bool isInternetConnection = false;
  bool isRefresh=false;
  // final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // Check for internet connection
    var connectivityResult = await Connectivity().checkConnectivity();
    log(connectivityResult.toString());
    if (connectivityResult[0] == ConnectivityResult.none) {
      setState(() {
        isInternetConnection = false;
      });
      showNoInternetDialog(context);
      throw Exception('No Internet connection');
    } else {
      setState(() {
        isInternetConnection = true;
        isRefresh=true;
      });
      // _scrollController.addListener(() {
      //   if (_scrollController.position.pixels ==
      //       _scrollController.position.maxScrollExtent) {
      //     ref.read(newsProvider.notifier).getData(context, _selectedCountryName);
      //   }
      // });
      //  Get the data form newsProvider
      ref.read(newsProvider.notifier).getData(context, _selectedCountryName);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current state of the newsProvider
    final newsArticles = ref.watch(newsProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            "Article List",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          actions: [
            isRefresh?IconButton(onPressed: (){
              getData();
            }, icon: Icon(Icons.refresh, color: ColorRes.textBlack,size:22,)):const SizedBox(),
          SizedBox(width: 10.w,)
          ],
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          color: ColorRes.white,
          child: isInternetConnection
              ? newsArticles.when(
                  data: (data) {
                    return data.isEmpty
                        ? emptyDataWidget(
                            context,
                            textTitle: 'No Article list',
                          )
                        : ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final article = data[index];
                              return (article.title == "[Removed]")
                                  ? const SizedBox()
                                  : articleListCard(context, article: article);
                            },
                          );
                  },
                  error: (e, st) => errorWidget(context, onTap: () {
                        ref.read(newsProvider.notifier).getData(context,
                            _selectedCountryName); //  Get the data form newsProvider
                      }),
                  loading: () => loadingWidget(context))
              : noInternetWidget(context),
        )));
  }
}
