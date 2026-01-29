import 'package:coinbase_wallet/models/assets_model.dart';
import 'package:flutter/material.dart';


class WatchlistProvider extends ChangeNotifier {
  final List<AssetModel> _assets = [
    AssetModel(name: 'Bitcoin', symbol: 'BTC', price: 62340, change: 2.45),
    AssetModel(name: 'Ethereum', symbol: 'ETH', price: 3450, change: -1.12),
    AssetModel(name: 'Solana', symbol: 'SOL', price: 128, change: 3.78),
    AssetModel(name: 'Cardano', symbol: 'ADA', price: 0.58, change: -0.84),
  ];

  List<AssetModel> get assets => _assets;
}
