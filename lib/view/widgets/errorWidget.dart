import 'package:flutter/material.dart';
import '../../constant/colors.dart';


Widget errorWidget(
    BuildContext context,{required Function() onTap,}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextButton(onPressed:onTap, child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Icon(Icons.refresh, color: ColorRes.textGrey,size: 12,),
          const SizedBox(width: 10,),
          Text("Refresh", style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(
              color: ColorRes.textGrey,
              fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
          ),textAlign: TextAlign.start,maxLines: 2,
          ),
        ],
      ),)
    ],
  );
}
