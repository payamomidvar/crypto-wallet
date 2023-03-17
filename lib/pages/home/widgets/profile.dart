import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(kMediumRadius)),
          child: Image.asset('assets/images/payam.jpg', width: 70, height: 70),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Text(
            'Hello, Payam',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const Spacer(),
        const Icon(Icons.notifications_none)
      ],
    );
  }
}
