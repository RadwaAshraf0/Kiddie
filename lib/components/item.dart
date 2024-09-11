import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';

class Item {
  final Color? circleColor;
  final double? circleBottom;
  final double? circleTop;
  final double? circleRight;
  final double? circleLeft;
  final double? imageRight;
  final double? imageLeft;
  final double? textRight;
  final double? textLeft;
  final Color bgColor;
  final String? sound;
  final String? image;
  final String? enName;
  final String? description;
  final Function()? onTap;

  const Item(    
      {this.circleColor, 
      this.circleBottom, 
      this.circleTop, 
      this.circleRight, 
      this.circleLeft, 
      this.imageRight, 
      this.imageLeft, 
      this.textRight, 
      this.textLeft,
      this.onTap,
      this.sound,
      required this.bgColor,
      this.image,
      this.enName,
      this.description});

  playSound() {
    final player = AudioPlayer();
    player.play(AssetSource(sound!));
  }
}