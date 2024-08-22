// ignore: file_names
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  // ignore: non_constant_identifier_names
  final Color BgColor;
  final Color circleColor;
  final double bottom;
  final double top;
  final double right;
  final double left;
  // ignore: non_constant_identifier_names
  final double image_right;
  // ignore: non_constant_identifier_names
  final double image_left;
  // ignore: non_constant_identifier_names
  final double text_right;
  // ignore: non_constant_identifier_names
  final double text_left;

  const FeatureCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    // ignore: non_constant_identifier_names
    required this.BgColor,
    required this.circleColor,
    required this.bottom,
    required this.top,
    required this.right,
    required this.left,
    // ignore: non_constant_identifier_names
    required this.image_right,
    // ignore: non_constant_identifier_names
    required this.image_left,
    // ignore: non_constant_identifier_names
    required this.text_right,
    // ignore: non_constant_identifier_names
    required this.text_left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        color: BgColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: bottom,
              left: left,
              top: top,
              right: right,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: circleColor,
                ),
              ),
            ),
            Positioned(
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              right: image_right,
                              left: image_left,
                              child: Image.asset(
                                image,
                                height: MediaQuery.of(context).size.height * 0.2,
                              ),
                            ),
                            Positioned(
                              right: text_right,
                              left: text_left,
                              child: Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,top: MediaQuery.of(context).size.height * 0.03),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.01),
                                    Text(
                                      description,
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
