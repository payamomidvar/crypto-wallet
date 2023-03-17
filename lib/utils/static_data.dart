import 'package:crypto_dashboard_kit/models/coin.dart';

class StaticData {
  static final List<Coin> userCoins = [
    Coin(
      id: 1,
      amountProgress: 82.13,
      balance: 0.00692133,
      currentPrice: 3432.92,
      type: CoinType.bitcoin,
      percentProgress: 3,
      trend: Trend.up,
    ),
    Coin(
      id: 2,
      amountProgress: 13.10,
      balance: 2.45670,
      currentPrice: 90.96,
      type: CoinType.ethereum,
      percentProgress: 2.3,
      trend: Trend.up,
    ),
    Coin(
      id: 3,
      amountProgress: 5.25,
      balance: 0.00,
      currentPrice: 24.37,
      type: CoinType.liteCoin,
      percentProgress: 4,
      trend: Trend.down,
    ),
    Coin(
      id: 4,
      amountProgress: 13.10,
      balance: 0.00,
      currentPrice: 43.36,
      type: CoinType.monero,
      percentProgress: 2.3,
      trend: Trend.up,
    ),
    Coin(
      id: 5,
      amountProgress: 6.75,
      balance: 0.00,
      currentPrice: 0.0136,
      type: CoinType.tron,
      percentProgress: 2.7,
      trend: Trend.down,
    ),
  ];
}
