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
        // primarySwatch: Colors.black,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          // color: Colors.white,
        ),
      ),
      home:
          // Test()
          CharacterListingScreen(),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF6A26A0),
                // Color(0xFFCF5CCF),
                // Color(0xFFFF57AC),
                // Color(0xFFFF559F),
                Color(0xFFFF6D91),
                Color(0xFFFF8D7E),
                Color(0xFFB6BAA6),
              ],
              stops: [
                .15,
                .45,
                .65,
                .85,
              ]),
        ),
        child: Center(
          child: Image.asset('assets/images/he.png'),
        ),
      ),
    );
  }
}
