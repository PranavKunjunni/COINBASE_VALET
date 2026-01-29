import 'package:coinbase_wallet/models/assets_model.dart';
import 'package:flutter/material.dart';

class BuyAssetProvider extends ChangeNotifier {
  final AssetModel asset;

  BuyAssetProvider(this.asset);

  String fiatAmount = '';
  double cryptoValue = 0;

  void addDigit(String digit) {
    fiatAmount += digit;
    _calculate();
  }

  void removeDigit() {
    if (fiatAmount.isNotEmpty) {
      fiatAmount = fiatAmount.substring(0, fiatAmount.length - 1);
      _calculate();
    }
  }

  void _calculate() {
    final fiat = double.tryParse(fiatAmount) ?? 0;
    cryptoValue = fiat / asset.price;
    notifyListeners();
  }
}
