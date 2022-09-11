import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final Future<void> Function() refreshFunction;

  const MyErrorWidget({super.key, required this.refreshFunction});

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.error),
              SizedBox(height: 5),
              Text(
                "We found some error. Click the below button to retry.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
