import 'package:flutter/material.dart';

import '../../controller/utils/navigation.dart';
import '../../controller/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initMethod();
  }

  @override
  Scaffold build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Text(
            "codetrade.io",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
}

extension _ExtensionMethods on _SplashScreenState {
  void _initMethod() {
    Future.delayed(
      const Duration(seconds: 3),
      () => replaceNamedRoute(context, Routes.homeScreen),
    );
  }
}
