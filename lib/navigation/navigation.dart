import 'package:flutter_modular/flutter_modular.dart';

import '../view/articleDetailScreen.dart';
import '../view/homeScreen.dart';

class Navigation extends Module {
  static const String splashScreen = '/splashScreen';
  static const String articleDetailScreen = '/articleDetailScreen';

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (_) => const HomeScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 500));
    r.child(articleDetailScreen,
        child: (_) => ArticleDetailScreen(article: r.args.data,),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 500));
   }
}
