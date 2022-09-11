import 'package:flutter/material.dart';

class MyCenterLoader extends StatelessWidget {
  const MyCenterLoader({super.key});

  @override
  DecoratedBox build(BuildContext context) => const DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
}
