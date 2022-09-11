import 'package:flutter/cupertino.dart';

/// Methods for push to widget page routes(Material)
Future<void> pushToMaterial(BuildContext context, Widget name) async =>
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => name),
    );

void pushReplaceMaterial(BuildContext context, Widget name) =>
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => name),
    );

void replaceRouteMaterial(BuildContext context, Widget name) =>
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => name),
      (Route<dynamic> route) => false,
    );

/// Methods for push to widget page routes(Cupertino)
Future<void> pushToCupertino(BuildContext context, Widget name) async =>
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => name),
    );

void pushReplaceCupertino(BuildContext context, Widget name) =>
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => name),
    );

void replaceRouteCupertino(BuildContext context, Widget name) =>
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => name),
      (Route<dynamic> route) => false,
    );

/// Methods for push to named routes.
Future<void> pushToNamed(BuildContext context, String name) async =>
    await Navigator.pushNamed(context, name);

Future<void> pushReplaceName(BuildContext context, String name) async =>
    await Navigator.pushReplacementNamed(context, name);

void replaceNamedRoute(BuildContext context, String name) =>
    Navigator.pushNamedAndRemoveUntil(context, name, (route) => false);
