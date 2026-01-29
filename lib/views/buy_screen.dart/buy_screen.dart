import 'package:coinbase_wallet/controllers/buy_provider/buy_provider.dart';
import 'package:coinbase_wallet/models/assets_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyAssetScreen extends StatelessWidget {
  final AssetModel asset;

  const BuyAssetScreen({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BuyAssetProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Buy ${asset.symbol}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'SGD ${provider.fiatAmount.isEmpty ? '0' : provider.fiatAmount}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              '${provider.cryptoValue.toStringAsFixed(6)} ${asset.symbol}',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),
            _infoTile('Network', 'Bitcoin'),
            _infoTile('Payment Method', 'Bank Transfer'),
            const SizedBox(height: 24),
            _numericKeypad(provider),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: provider.fiatAmount.isEmpty ? null : () {},
                child: const Text('Continue to payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(color: Colors.grey)),
      trailing: Text(value, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _numericKeypad(BuyAssetProvider provider) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        ...List.generate(9, (i) => _key('${i + 1}', provider)),
        _key('⌫', provider, isDelete: true),
        _key('0', provider),
        const SizedBox(),
      ],
    );
  }

  Widget _key(String text, BuyAssetProvider provider,
      {bool isDelete = false}) {
    return GestureDetector(
      onTap: () {
        isDelete ? provider.removeDigit() : provider.addDigit(text);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
