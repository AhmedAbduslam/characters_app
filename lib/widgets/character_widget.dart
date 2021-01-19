import 'package:characters_app/models/characters.dart';
import 'package:characters_app/pages/character_detail_screen.dart';
import 'package:characters_app/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;

  const CharacterWidget({
    Key key,
    this.character,
    this.pageController,
    this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterDetailScreen(character)),
        );
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          // double value = 1;
          // if (pageController.position.haveDimensions) {
          //   value = pageController.page - currentPage;
          //   value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          // }

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Hero(
                      tag: 'background',
                      child: ClipPath(
                        clipper: CharacterCardShaper(),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: character.colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: 'image',
                      child: Image.asset(
                        character.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 32, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Hero(
                            tag: 'name',
                            child: Text(
                              character.name,
                              style: AppTheme.heading,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Tap to Read more",
                        style: AppTheme.subHeading,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CharacterCardShaper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * .3);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(0, size.height, curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(
        size.width, size.height, size.width, size.height - curveDistance);
    clippedPath.lineTo(size.width, curveDistance * 3);
    clippedPath.quadraticBezierTo(size.width, curveDistance,
        size.width - curveDistance * 2, curveDistance * 1.5);
    clippedPath.lineTo(curveDistance, size.height * 0.27);
    clippedPath.quadraticBezierTo(0, size.height * .3, 0, size.height * 0.4);

    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
