import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final void Function() refreshFunction;

  const ErrorScreen({super.key, required this.refreshFunction});

  @override
  Scaffold build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.white,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 40, color: Color(0XFF0B5A47)),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "We found some error. Click the below button to retry.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                IconButton(
                  onPressed: refreshFunction,
                  iconSize: 40,
                  color: const Color(0XFF0B5A47),
                  icon: const Icon(Icons.refresh),
                )
              ],
            ),
          ),
        ),
      );
}
