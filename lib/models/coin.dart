import 'package:crypto_dashboard_kit/utils/string_extension.dart';

enum CoinType {
  bitcoin,
  ethereum,
  liteCoin,
  monero,
  tron,
}

enum Trend { up, down }

class Coin {
  final int id;
  final CoinType type;
  final double currentPrice;
  final double percentProgress;
  final double amountProgress;
  final double balance;
  final Trend trend;


  Coin({
    required this.id,
    required this.currentPrice,
    required this.percentProgress,
    required this.amountProgress,
    required this.balance,
    required this.type,
    required this.trend,

  });

  String getCoinAbbr() {
    if (type == CoinType.bitcoin) {
      return "BTC";
    } else if (type == CoinType.ethereum) {
      return "ETH";
    } else if (type == CoinType.liteCoin) {
      return "LTC";
    } else if (type == CoinType.monero) {
      return "XMR";
    } else if (type == CoinType.tron) {
      return "TRX";
    } else {
      return "";
    }
  }

  String getImagePath() {
    if (type == CoinType.bitcoin) {
      return "assets/images/btc.png";
    } else if (type == CoinType.ethereum) {
      return "assets/images/eth.png";
    } else if (type == CoinType.liteCoin) {
      return "assets/images/ltc.png";
    } else if (type == CoinType.monero) {
      return "assets/images/xmr.png";
    } else if (type == CoinType.tron) {
      return "assets/images/tron.png";
    } else {
      return "assets/images/bitcoin.png";
    }
  }

  @override
  String toString() {
    String firstPart = type.toString().split(".")[1];
    return firstPart.capitalize();
  }
}
