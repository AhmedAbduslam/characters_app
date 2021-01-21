import 'package:characters_app/models/character.dart';
import 'package:characters_app/styleguide.dart';
import 'package:characters_app/widgets/character_widget.dart';
import 'package:flutter/material.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CharacterListingScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Despicable Me", style: AppTheme.display1),
                      TextSpan(text: "\n"),
                      TextSpan(text: "Characters", style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    for (var i = 0; i < characters.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: CharacterWidget(
                            character: characters[i],
                            pageController: _pageController,
                            currentPage: i),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
