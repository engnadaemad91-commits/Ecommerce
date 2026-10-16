import 'package:flutter/material.dart';

import 'core/dummy_data.dart';
import 'core/product_deep_link.dart';
import 'core/theme.dart';
import 'features/details/screens/product_details_screen.dart';
import 'features/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? initialRoute;

  const MyApp({super.key, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      onGenerateInitialRoutes: (routeName) => [
        _generateRoute(RouteSettings(name: routeName)),
      ],
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    if (settings.name == Navigator.defaultRouteName) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const SplashScreen(),
      );
    }

    final Product? product = productForDeepLink(settings.name);
    if (product != null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => ProductDetailsScreen(product: product),
      );
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => const Scaffold(
        body: Center(child: Text('Product not found')),
      ),
    );
  }
}
