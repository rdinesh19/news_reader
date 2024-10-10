import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void showNoInternetDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('No Internet Connection',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
        content: Text('Please check your internet settings.',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
        actions: <Widget>[
          TextButton(
            child: Text('Settings',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            onPressed: () {
              Navigator.of(context).pop();
              _openSettings();
            },
          ),
          TextButton(
            child: Text('Close',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
 Future<void> _openSettings() async {
await openAppSettings();
}