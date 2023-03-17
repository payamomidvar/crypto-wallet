class ChartData {
  ChartData({
    required this.dateTime,
    required this.open,
    required this.close,
    required this.height,
    required this.low,
  });

  final DateTime dateTime;
  final double open;
  final double close;
  final double height;
  final double low;
}
