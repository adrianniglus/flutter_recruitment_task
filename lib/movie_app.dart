import 'package:flutter/material.dart';

import 'app/pages/utils/hide_keyboard.dart';
import 'app/pages/utils/router/app_router.dart';

class MovieApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => _globalUnfocusKeyboard(
        context: context,
        // MaterialApp.router is used to enable the AutoRoute package
        child: MaterialApp.router(
          title: 'Movie Browser',
          theme: ThemeData(primarySwatch: Colors.amber),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      );

// Function to hide the keyboard when the user taps outside the text field
  Widget _globalUnfocusKeyboard({
    required BuildContext context,
    required Widget child,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => hideKeyboard(context),
        child: child,
      );
}
