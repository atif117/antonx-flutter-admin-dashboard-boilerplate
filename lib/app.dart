import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/controllers/menu_controller.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({required this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: AdaptiveTheme(
          light: ThemeData.light().copyWith(
            scaffoldBackgroundColor: creamColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.black),
            canvasColor: snowColor,
          ),
          dark: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => GetMaterialApp(
            title: title,
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        ));

    // AdaptiveTheme(
    //   light: ThemeData.light().copyWith(
    //     scaffoldBackgroundColor: creamColor,
    //     textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //         .apply(bodyColor: Colors.black),
    //     canvasColor: snowColor,
    //   ),
    //   dark: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: bgColor,
    //     textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //         .apply(bodyColor: Colors.white),
    //     canvasColor: secondaryColor,
    //   ),
    //   initial: AdaptiveThemeMode.light,
    //   builder: (theme, darkTheme) => GetMaterialApp(
    //     title: title,
    //     theme: theme,
    //     darkTheme: darkTheme,
    //     debugShowCheckedModeBanner: false,
    //     home: MultiProvider(
    //       providers: [
    //         ChangeNotifierProvider(
    //           create: (context) => MenuController(),
    //         ),
    //       ],
    //       child: MainScreen(),
    //     ),
    //   ),
    // );

    //   ScreenUtilInit(
    //     designSize: const Size(375, 812),
    //     builder: (context, widget) => GetMaterialApp(
    //       translations: LocalizationService(),
    //       locale: const Locale("en"),
    //       title: title,
    //       home: const SplashScreen(),
    //     ),
    //   );
  }
}
