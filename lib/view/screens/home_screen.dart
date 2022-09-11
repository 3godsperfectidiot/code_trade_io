import 'package:flutter/material.dart';

import '../../controller/provider/about_provider.dart';
import '../../model/about_model.dart';
import 'textfields/search_text_field_prefix.dart';
import 'error_screen.dart';
import '../widgets/about/about_builder.dart';
import '../widgets/custom/my_center_loader.dart';
import '../widgets/custom/my_custom_toast.dart';
import '../widgets/custom/my_loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

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
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return _isLoading
        ? const MyCenterLoader()
        : _isError
            ? ErrorScreen(refreshFunction: _initMethod)
            : Scaffold(
                appBar: AppBar(
                  toolbarHeight: 125,
                  title: Column(
                    children: [
                      Text(_aboutData.title),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: width < 450 ? double.infinity : width / 1.25,
                        child: SearchTextFieldPrefix(
                          prefix: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                            iconSize: 24,
                            color: const Color(0XFF0B5A47),
                          ),
                          func: _search,
                          controller: _searchController,
                        ),
                      )
                    ],
                  ),
                ),
                body: RefreshIndicator(
                  onRefresh: _initMethod,
                  child: const AboutBuilder(),
                ),
              );
  }
}

extension _SearchMethods on _HomeScreenState {
  void _search(String val) async {
    showLoader(context);
    AboutProvider.aboutProviderInstanace.searchData(val).then(
          (_) => Navigator.pop(context),
        );
  }
}
