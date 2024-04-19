import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/utils/hide_keyboard.dart';
import 'app/utils/router/app_router.dart';
import 'app/utils/translations/generated/l10n.dart';

class MovieApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => _globalUnfocusKeyboard(
        context: context,
        // MaterialApp.router is used to enable the AutoRoute package
        child: MaterialApp.router(
          // LocalizationsDelegates and supportedLocales are required for the
          // Translation class to work
          localizationsDelegates: const [
            Translation.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            // Add more locales here if needed
          ],
          onGenerateTitle: (ctx) => Translation.of(ctx).appTitle,
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
