import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_mate/screens/categories.dart';
import 'package:meal_mate/screens/tabs.dart';

final theme  = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
      seedColor: Colors.blue),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  // for using the provider we need to wrap the MyApp in the ProviderScope widget because it gives access to use behind the scene functionality of state management.
 // And wrapping the entire app in the ProviderScope widget helps to use Riverpod features in the entire app.
  runApp(ProviderScope(
      child: const MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(context) {
    return MaterialApp(
      theme: theme,
      home: TabsScreen(),
    );
  }
}

