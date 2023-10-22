import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideabook/app/app.bottomsheets.dart';
import 'package:ideabook/app/app.dialogs.dart';
import 'package:ideabook/app/app.locator.dart';
import 'package:ideabook/app/app.router.dart';
import 'package:ideabook/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: kcBackgroundColor,
        focusColor: kcPrimaryColor,
        textTheme: GoogleFonts.latoTextTheme(textTheme).apply(
          bodyColor: Colors.black,
        ),
      ),
      initialRoute: Routes.notesView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
