import 'package:flutter/material.dart';
import '../../constant/colors.dart';


Widget loadingWidget(
    BuildContext context) {
  return Center(
    child: SizedBox(
        width: 15,height: 15,
        child: Center(child:CircularProgressIndicator(color: ColorRes.lightGrey,))),
  );
}
