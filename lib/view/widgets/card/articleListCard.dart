import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/colors.dart';
import '../../../model/artical_model.dart';
import '../../../navigation/navigation.dart';
Widget articleListCard(
    BuildContext context,{required Article article}) {
  return GestureDetector(
    onTap: (){
      Modular.to.pushNamed(Navigation.articleDetailScreen,arguments: article);

    },
    child: Card(
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        title: Text(article.title, style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(
            fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
        ),textAlign: TextAlign.start,maxLines: 1,),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.description, style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: ColorRes.textGrey,
                fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
            ),textAlign: TextAlign.start,maxLines: 2,
            ),
            SizedBox(height: 5.h,),
            Text(DateFormat("dd MMM yyyy").format(DateTime.parse(article.publishedAt.toString())), style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: ColorRes.textGrey,
                fontSize:8,
                fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
            ),textAlign: TextAlign.start,maxLines:1,
            ),
          ],
        ),
        leading:  CachedNetworkImage(
          width: 100.w,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              Center(
                child: SizedBox(
                    width: 15,height: 15,
                    child: Center(child:CircularProgressIndicator(color: ColorRes.lightGrey,))),
              ),
          errorWidget: (context, url, error) =>Center(
            child:Icon(Icons.image_not_supported,size: 32,color:ColorRes.textGrey,),
          ),
          imageUrl:article.urlToImage,),


      ),
    ),
  );
}
