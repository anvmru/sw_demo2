import 'package:flutter/material.dart';
import 'package:sw_demo2/home_page.dart';
import 'package:wear/wear.dart';

/*
  Использование датчиков
*/

void main() {
  //FlutterNativeSplash.removeAfter(init);
  runApp(const MyApp());
}

// Future init() async {
//   await Future.delayed(Duration(seconds: 2));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      child: const HomePage(),
      builder: (BuildContext context, WearMode mode, Widget? child) {
        return MaterialApp(
          theme: _themeData(mode),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
    );
  }

  // Меняем общую тему в зависимости от режима
  ThemeData _themeData(WearMode mode) {
    return mode == WearMode.active
        ? ThemeData(
            visualDensity: VisualDensity.compact,
            useMaterial3: true,
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF00B5FF),
            ),
          )
        : ThemeData(
            visualDensity: VisualDensity.compact,
            useMaterial3: true,
            colorScheme: const ColorScheme.dark(
              // dark colorscheme
              primary: Colors.white24,
              onBackground: Colors.white10,
              onSurface: Colors.white24,
            ),
            textTheme: const TextTheme(
              headlineMedium: TextStyle(color: Colors.white24),
              bodyMedium: TextStyle(color: Colors.white10),
            ),
          );
  }
}
