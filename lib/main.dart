import 'package:code_trade_io/controller/provider/about_provider.dart';
import 'package:code_trade_io/controller/utils/routes.dart';
import 'package:code_trade_io/view/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => AboutProvider(),
        child: MaterialApp(
          title: "Code Trade IO",
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          routes: Routes().routes,
        ),
      );
}


/// This code base is build on Flutter V: 3.3.1
/// And Dart >=2.18.0 <3.0.0
/// 
/// All those methods that doesn't contain setState method in it are written in
/// extension methods and all remians are writter in .