import 'package:crypto_dashboard_kit/pages/home/widgets/my_wallet.dart';
import 'package:crypto_dashboard_kit/pages/home/widgets/coins.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'widgets/menu.dart';
import 'widgets/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
            vertical: kLargePadding,
          ),
          child: Column(
            children: [
              const Profile(),
              const SizedBox(height: kMediumHeight),
              const MyWallet(),
              const SizedBox(height: kMediumHeight),
              const Menu(),
              const SizedBox(height: kMediumHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: kSuccessColor),
                  ),
                ],
              ),
              const SizedBox(height: kSmallHeight),
              const Expanded(child: Coins()),
            ],
          ),
        ),
      ),
    );
  }
}
