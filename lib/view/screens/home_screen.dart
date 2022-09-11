import 'package:code_trade_io/view/widgets/about/about_builder.dart';
import 'package:code_trade_io/view/widgets/custom/my_error_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/provider/about_provider.dart';
import '../../model/about_model.dart';
import '../widgets/custom/my_center_loader.dart';
import '../widgets/custom/my_custom_toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true, _isError = false;
  late AboutModel _aboutData;

  @override
  void initState() {
    super.initState();
    _initMethod();
  }

  /// API call for about data.
  Future<void> _initMethod() async {
    try {
      final aboutProvider = AboutProvider.aboutProviderInstanace;
      await aboutProvider.loadAboutData();
      if (mounted) {
        _aboutData = aboutProvider.getAboutData;
        _isLoading = false;
      }
    } catch (e) {
      myCustomErrorToast(e);
      _isError = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const MyCenterLoader()
        : _isError
            ? MyErrorWidget(refreshFunction: _initMethod)
            : Scaffold(
                appBar: AppBar(title: Text(_aboutData.title)),
                body: RefreshIndicator(
                  onRefresh: _initMethod,
                  child: const AboutBuilder(),
                ),
              );
  }
}
