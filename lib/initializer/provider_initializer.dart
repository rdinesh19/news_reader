
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../theme/provider/theme_provider.dart';


class ProviderInitialization extends StatelessWidget {
  final Widget? child;
  const ProviderInitialization({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: child);
  }
}