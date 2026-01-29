import 'package:coinbase_wallet/models/assets_model.dart';
import 'package:flutter/material.dart';

class AssetTile extends StatelessWidget {
  final AssetModel asset;

  const AssetTile({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final isPositive = asset.change >= 0;

    return ListTile(
      title: Text(
        asset.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(asset.symbol),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${asset.price.toStringAsFixed(2)}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            '${asset.change.toStringAsFixed(2)}%',
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
