import 'package:coinbase_wallet/controllers/buy_provider/buy_provider.dart';
import 'package:coinbase_wallet/models/assets_model.dart';
import 'package:coinbase_wallet/router/app_bottom_nav.dart';
import 'package:coinbase_wallet/views/asset_details_screen/asste_details_screen.dart';
import 'package:coinbase_wallet/views/buy_screen.dart/buy_screen.dart';
import 'package:coinbase_wallet/views/costList_screen/costList.dart';
import 'package:coinbase_wallet/views/globe_screen/globe.dart';
import 'package:coinbase_wallet/views/home_screen/home_screen.dart';
import 'package:coinbase_wallet/views/wallet_screen.dart/wallet.dart';
import 'package:coinbase_wallet/views/watchlist_screen/watchlist_screen.dart';
import 'package:coinbase_wallet/views/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/buy',
      builder: (context, state) {
        final asset = state.extra as AssetModel?;
        if (asset == null) {
          return const Scaffold(
            body: Center(child: Text('No asset selected')),
          );
        }

        return ChangeNotifierProvider(
          create: (_) => BuyAssetProvider(asset),
          child: BuyAssetScreen(asset: asset),
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: AppBottomNav(
            currentRoute: state.uri.path,
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/watchlist',
          builder: (context, state) => const WatchlistScreen(),
        ),
        GoRoute(
          path: '/globe',
          builder: (context, state) => const Globe(),
        ),
        GoRoute(
          path: '/wallet',
          builder: (context, state) => const Wallet(),
        ),
        GoRoute(
          path: '/costlist',
          builder: (context, state) => const Costlist(),
        ),
        GoRoute(
          path: '/asset-details',
          builder: (context, state) {
            final asset = state.extra as AssetModel?;
            if (asset == null) {
              return const Scaffold(
                body: Center(child: Text('No asset selected')),
              );
            }
            return AssetDetailsScreen(asset: asset);
          },
        ),
      ],
    ),
  ],
);
