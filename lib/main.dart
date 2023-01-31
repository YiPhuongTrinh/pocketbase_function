import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketbase_function/page/login_page.dart';
import 'package:pocketbase_function/view/provider/login_provider.dart';
import 'package:pocketbase_function/view/provider/post_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => SinglePostProvider()),
      ],
      child: MaterialApp(
        title: 'PocketBase Function',
        debugShowCheckedModeBanner: false,
        // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
        theme: FlexThemeData.light(
          textTheme:
              GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
          scheme: FlexScheme.blue,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 9,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            elevatedButtonRadius: 5.0,
            inputDecoratorRadius: 5.0,
            inputDecoratorFocusedBorderWidth: 0.5,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          textTheme:
              GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),

          scheme: FlexScheme.blue,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 15,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            inputDecoratorRadius: 40.0,
            inputDecoratorFocusedBorderWidth: 0.5,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
        themeMode: ThemeMode.light,
        home: const LoginPage(),
      ),
    );
  }
}
