import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:zameenclone/Globals.dart';
import 'HtpResponse.dart';

class RestService {
  bool result = false;

  Map<String, String> xFormHeaders = {'Content-Type': 'application/x-www-form-urlencoded'};
  Map<String, String> appJsonHeaders = {'Content-Type': 'application/json'};

  static Future<List<dynamic>> handleGet(String url) async {
    Uri uri = Uri.parse(url);
    print('Proc: ' + url);
    print('Url: ' + url);
    print('API Auth Token: ' + gPrefStrApiAuthToken.toString());
    var response;
    await http.get(uri, headers: {
      // 'Authorization': 'Bearer $gPrefStrApiAuthToken',

    }).then((value) {
      response = value;
    }).onError((error, stackTrace) {
      print('Error: ${error}\nStack: ${stackTrace}');
    });

    print(response);

    return json.decode(response.body);
  }

  Future<HtpResponse> handlePost(String url, Object? postObject, String proc) async {
    HtpResponse phpMySqlResponse = HtpResponse.empty();
    Uri uri = Uri.parse(url);
    print('Proc: ' + proc);
    print('Url: ' + url);
    print('Body: ' + postObject.toString());
    print('API Auth Token: ' + gPrefStrApiAuthToken.toString());
    await http.post(uri, body: postObject, headers: {
      'Authorization': 'Bearer $gPrefStrApiAuthToken',
    }).then((response) {
      final int statusCode = response.statusCode;
      print('>>> response.statusCode ' + response.statusCode.toString());
      print('>>> response.body ' + response.body);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("ERROR-$proc while post request.");
      }
      Map<String, dynamic> mp = json.decode(response.body);
      phpMySqlResponse = HtpResponse(mp['message'], mp['count'], mp['objects'], mp['token'], proc);
    }).onError((error, stackTrace) {
      print('onERROR-$proc: $error, STACKTRACE: $stackTrace');
    }).catchError((onError) {
      print('catchERROR-$proc: $onError');
    });
    return phpMySqlResponse;
  }
}

class Api {
  static const _REMOTE_URL = 'https://zameenclone.azurewebsites.net/api/';
  static const _DESKTOP_LOCAL_URL = 'http://127.0.0.1:8000/api/';
  static const _ANDROID_LOCAL_URL = 'http://192.168.18.11:8000/api/';
  static String _baseUrl = _REMOTE_URL;
  // Platform.isAndroid
  //     ? _REMOTE_URL
  //     : Platform.isWindows
  //         ? _DESKTOP_LOCAL_URL
  //         : '';

  static const _propTypes = 'types/';
  static const _ads = 'ads/';
  static const _cities = 'cities/';
  static const _locations = 'locations/';
  static const _subtypes = 'subtypes/';

  static String getPropTypes = _baseUrl + _propTypes;
  static String getAds = _baseUrl + _ads;
  static String getCities = _baseUrl + _cities;
  static String getLocations = _baseUrl + _locations;
  static String getSubTypes = _baseUrl + _subtypes;
}
