import 'package:crypto_dashboard_kit/models/coin.dart';
import 'package:crypto_dashboard_kit/pages/coin_detail/widgets/coin_chart.dart';
import 'package:crypto_dashboard_kit/pages/coin_detail/widgets/coin_stats.dart';
import 'package:crypto_dashboard_kit/utils/constants.dart';
import 'package:flutter/material.dart';

class CoinDetail extends StatelessWidget {
  final Coin coin;

  const CoinDetail({required this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header(context),
              const SizedBox(height: kTinyHeight),
              CoinStats(coin: coin),
              const SizedBox(height: kMediumHeight),
              CoinChart(name: coin.getCoinAbbr()),
              itemBuilder("Opening Price", '\$442.54', context),
              const Divider(
                color: Colors.grey,
                endIndent: kSmallWidth,
                indent: kSmallWidth,
              ),
              itemBuilder("Previous Closing Price", '\$467.42', context),
              const Divider(
                color: Colors.grey,
                endIndent: kSmallWidth,
                indent: kSmallWidth,
              ),
              itemBuilder("Weekly Range", '\$178.42 - \$431.12', context),
              const Divider(
                color: Colors.grey,
                endIndent: kSmallWidth,
                indent: kSmallWidth,
              ),
              itemBuilder(
                  "Volume", '\$823.76 - ${coin.getCoinAbbr()}', context),
              actionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemBuilder(
      final String title, final String value, final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMediumPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kTextColor),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget actionButtons(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSmallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kSuccessColor,
              padding: const EdgeInsets.symmetric(
                vertical: kTinyPadding,
                horizontal: kGiantPadding,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(kMediumRadius),
                ),
              ),
            ),
            child: Text(
              "Buy",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
            ),
          ),
          const SizedBox(width: kMediumWidth),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kDangerColor,
              padding: const EdgeInsets.symmetric(
                vertical: kTinyPadding,
                horizontal: kGiantPadding,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(kMediumRadius),
                ),
              ),
            ),
            child: Text(
              "Sell",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
            ),
          )
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kMediumPadding, vertical: kLargePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          Text(coin.toString()),
          const Icon(Icons.notifications_none)
        ],
      ),
    );
  }
}
