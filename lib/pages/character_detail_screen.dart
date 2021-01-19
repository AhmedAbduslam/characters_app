import 'package:characters_app/models/characters.dart';
import 'package:characters_app/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailScreen(this.character);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'background',
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.character.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.close),
                      color: Colors.white.withOpacity(0.9),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: 'image',
                      child: Image.asset(widget.character.imagePath,
                          height: screenHeight * 0.45),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Hero(
                          tag: 'name',
                          child: Text(widget.character.name,
                              style: AppTheme.heading))),
                  SizedBox(height: 16.0),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(widget.character.description,
                          style: AppTheme.subHeading)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
