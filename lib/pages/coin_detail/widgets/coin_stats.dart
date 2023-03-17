import 'package:crypto_dashboard_kit/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/coin.dart';

class CoinStats extends StatelessWidget {
  final Coin coin;

  const CoinStats({required this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kLargePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current price",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kTextColor),
              ),
              const SizedBox(height: kTinyHeight),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "\$${coin.currentPrice.toInt()}.",
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: coin.currentPrice.toString().split('.')[1],
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: kMediumPadding),
                    padding: const EdgeInsets.symmetric(
                      horizontal: kMediumPadding,
                      vertical: kTinyPadding,
                    ),
                    decoration: BoxDecoration(
                      color:
                          coin.trend == Trend.up ? kSuccessColor : kDangerColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(kLargeRadius),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          coin.trend == Trend.up ? "+" : "-",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                        Text(
                          "${coin.percentProgress}%",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
