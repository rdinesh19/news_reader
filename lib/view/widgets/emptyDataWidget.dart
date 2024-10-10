import 'package:flutter/material.dart';
Widget emptyDataWidget(
    BuildContext context,{required String textTitle,}) {
  return Center(child: Text(textTitle, style: Theme.of(context)
      .textTheme
      .bodyLarge!
      .copyWith(
      fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
  ),textAlign: TextAlign.start,maxLines: 2,));
}
