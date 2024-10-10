import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';
import '../model/artical_model.dart';

class ArticleDetailScreen extends StatefulWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back,color: ColorRes.textBlack,),


          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Article Details",style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(
          fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
      ),textAlign: TextAlign.start,maxLines: 2,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    SizedBox(
                        width: 15,height: 15,
                        child: Center(child:CircularProgressIndicator(color: ColorRes.lightGrey,))),
                errorWidget: (context, url, error) =>Center(
                  child:Icon(Icons.image_outlined,size: 32,color:ColorRes.textBlack,),
                ),
                imageUrl:widget.article.urlToImage,),
SizedBox(height: 15.h,),
              Text(widget.article.title, style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                  fontWeight: FontWeight.w500
              ),textAlign: TextAlign.start,),
              SizedBox(height: 10.h,),
              Text(widget.article.description,  style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                  fontWeight: FontWeight.w400
              ),textAlign: TextAlign.start,),
              SizedBox(height: 10.h,),
              Text(DateFormat("dd MMM yyyy").format(DateTime.parse(widget.article.publishedAt.toString())),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                  color: ColorRes.textGrey,
                    fontWeight: FontWeight.w400
                ),textAlign: TextAlign.start,),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back',style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: ColorRes.lightBlue,
                      fontWeight: FontWeight.w400
                  ),textAlign: TextAlign.start,),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
