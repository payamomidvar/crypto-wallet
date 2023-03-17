import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../utils/constants.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        item(Icons.arrow_downward, 'Receive', 45, context),
        item(Icons.arrow_upward, 'Send', 45, context),
        item(Icons.swap_vert, 'Swap', 45, context),
        item(Icons.sell, 'Buy', 270, context),
        item(Icons.sell, 'Sell', 90, context),
      ],
    );
  }

  Widget item(IconData icon, String title, int rotate, BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(kMediumRadius),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(kMediumRadius),
            ),
          ),
          child: Transform.rotate(
            angle: rotate * math.pi / 180,
            child: Icon(icon, color: Colors.white, size: 25),
          ),
        ),
        const SizedBox(height: kTinyHeight),
        Text(title, style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 14
        ))
      ],
    );
  }
}
