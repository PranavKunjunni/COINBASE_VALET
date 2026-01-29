import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNav extends StatelessWidget {
  final String currentRoute;

  const AppBottomNav({
    super.key,
    required this.currentRoute,
  });

  int _getIndex() {
    switch (currentRoute) {
      case '/home':
        return 0;
      case '/globe':
        return 1;
      case '/assetDetails':
        return 2;
      case '/wallet':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _getIndex(),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/watchlist');
            break;
          case 2:
            context.go('/assetDetails');
            break;
          case 3:
            context.go('/wallet');
            break;
            case 4:
            context.go('/globe');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Watchlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Globe',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.details),
          label: 'assetDetails',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
       
      ],
    );
  }
}
