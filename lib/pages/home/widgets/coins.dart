import 'package:crypto_dashboard_kit/pages/home/widgets/coin_card.dart';
import 'package:crypto_dashboard_kit/utils/static_data.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Coins extends StatelessWidget {
  const Coins({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CoinCard(
          coin: StaticData.userCoins[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: kTinyHeight);
      },
      itemCount: StaticData.userCoins.length,
    );
  }
}
