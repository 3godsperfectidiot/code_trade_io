import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../utils/api/api_manager.dart';
import '../../model/about_model.dart';
import '../../model/api/api_model.dart';

class AboutProvider with ChangeNotifier {
  static final AboutProvider aboutProviderInstanace = AboutProvider._();
  factory AboutProvider() => aboutProviderInstanace;
  AboutProvider._();

  final String _apiUrl =
      "https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf";

  final APIManager _apiManager = APIManager.apiManagerInstanace;

  late AboutModel _aboutData;

  // Getters
  AboutModel get getAboutData => _aboutData;

  // API Callers
  Future<void> loadAboutData() async {
    ApiResponseModel apiResponse =
        await _apiManager.apiRequest(_apiUrl, APIMethod.get);
    if (apiResponse.status) {
      _aboutData = AboutModel.fromJson(apiResponse.data);
      notifyListeners();
    } else {
      throw HttpException(apiResponse.error!.description);
    }
  }
}
