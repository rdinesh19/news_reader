import 'package:flutter/material.dart';
import '../../component/check_internet_connection.dart';
import '../../constant/colors.dart';


Widget noInternetWidget(
    BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("No Internet connection",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
      TextButton(onPressed: (){
        showNoInternetDialog(context);
      }, child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Icon(Icons.settings,  color: ColorRes.lightBlue,size: 12,),
          const SizedBox(width: 10,),
          Text("Internet Settings", style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(
              color: ColorRes.lightBlue,
              fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis
          ),textAlign: TextAlign.start,maxLines: 2,
          ),
        ],
      ),)
    ],
  );
}
