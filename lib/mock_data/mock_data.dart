class WatchlistItem {
  final String name;
  final String symbol;
  final String price;
  final String change;

  WatchlistItem({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
  });
}

class MockData {
  static List<WatchlistItem> watchlist = [
    WatchlistItem(
      name: 'Bitcoin',
      symbol: 'BTC',
      price: '\$42,500',
      change: '+2.5%',
    ),
    WatchlistItem(
      name: 'Ethereum',
      symbol: 'ETH',
      price: '\$2,950',
      change: '-1.2%',
    ),
  ];

  static List<String> trendingSwaps = [
    'BTC → ETH',
    'ETH → USDT',
    'SOL → BTC',
  ];
}
