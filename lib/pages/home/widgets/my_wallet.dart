import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Crypto Wallet",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: kTextColor),
        ),
        const SizedBox(height: kTinyHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "\$4,235.",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: '42',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              padding: const EdgeInsets.symmetric(
                horizontal: kLargePadding,
                vertical: kTinyPadding,
              ),
              decoration: const BoxDecoration(
                color: kSuccessColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(kLargeRadius),
                ),
              ),
              child: Text(
                "+2.41%",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            )
          ],
        ),
      ],
    );
  }
}
