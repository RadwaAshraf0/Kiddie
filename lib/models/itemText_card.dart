import 'package:flutter/material.dart';
import 'package:kiddie/components/item.dart';
import 'package:kiddie/models/item_card.dart';

import '../helper/custom_text.dart';

class ItemtextCard extends StatelessWidget {
  const ItemtextCard({super.key, required this.item, required this.size});
  final Item item;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: itemCard(item: item)),
        CustomText(fontSize: size, color: Colors.black, text: item.enName!),
      ],
    );
  }
}
