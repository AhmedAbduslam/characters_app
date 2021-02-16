import 'package:characters_app/pages/character_listing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Characters App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
      ),
      home: CharacterListingScreen(),
    );
  }
}
