import 'package:coinbase_wallet/controllers/watchlist_screenProvider/watchlist_provider.dart';
import 'package:coinbase_wallet/views/welcome_screen/widgets/button.dart';
import 'package:coinbase_wallet/widgets/assets_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watchlist = context.watch<WatchlistProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      context.go('/home');
                    },
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Watchlist',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: watchlist.assets.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  final asset = watchlist.assets[index];
                  return InkWell(
                    onTap: () {
                      context.push('/asset-details', extra: asset);
                    },
                    child: AssetTile(asset: asset),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CommonButton(
                title: 'Watch more assets',
                backgroundColor: Colors.grey.shade800,
                textColor: Colors.white,
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
