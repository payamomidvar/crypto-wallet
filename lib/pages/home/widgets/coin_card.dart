import 'package:crypto_dashboard_kit/models/coin.dart';
import 'package:crypto_dashboard_kit/pages/coin_detail/coin_detail.dart';
import 'package:crypto_dashboard_kit/utils/constants.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;

  const CoinCard({required this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return CoinDetail(coin: coin);
          },
        ),
      ),
      child: Container(
        height: kGiantHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(kMediumRadius)),
        ),
        padding: const EdgeInsets.all(kLargePadding),
        child: Row(
          children: [
            Image.asset(
              coin.getImagePath(),
              height: kLargeHeight,
              width: kLargeWidth,
            ),
            const SizedBox(width: kMediumWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: kTinyHeight),
                Text(
                  coin.getCoinAbbr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: kTextColor
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${coin.currentPrice}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height:kTinyHeight),
                Row(
                  children: [
                    Text(
                      '${coin.percentProgress}%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: coin.trend == Trend.up
                            ? kSuccessColor
                            : kDangerColor,
                      ),
                    ),
                    Icon(
                      coin.trend == Trend.up
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      size: kIconSize,
                      color:
                          coin.trend == Trend.up ? kSuccessColor : kDangerColor,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
