import 'package:flutter/material.dart';

void showLoader(context) async => await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: Colors.black26,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      ),
    );

class CenterCircleLoader extends StatelessWidget {
  const CenterCircleLoader({Key? key}) : super(key: key);

  @override
  Center build(BuildContext context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      );
}

class ContainerCircleLoader extends StatelessWidget {
  final double height, width;
  final Color color;

  const ContainerCircleLoader({
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Container build(BuildContext context) => Container(
        color: color,
        width: width,
        height: height,
        alignment: Alignment.center,
        child: const CircularProgressIndicator.adaptive(),
      );
}

class CenterMessage extends StatelessWidget {
  final String message;
  final Color color;

  const CenterMessage(
    this.message, {
    Key? key,
    this.color = const Color(0XFF345251),
  }) : super(key: key);

  @override
  Center build(BuildContext context) => Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: color),
        ),
      );
}

class ContainerCenterMesseage extends StatelessWidget {
  final double height, width;
  final Color color;
  final String message;

  const ContainerCenterMesseage(
    this.message, {
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.color = const Color(0XFF345251),
  }) : super(key: key);

  @override
  ConstrainedBox build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(minHeight: height, minWidth: width),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(color: color),
          ),
        ),
      );
}
