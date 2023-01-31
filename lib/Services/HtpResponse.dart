class HtpResponse {
  String _api = '';
  String _message = '';
  int _count = 0;
  List<dynamic> _list = List<dynamic>.empty(growable: true);
  List<Map<String, dynamic>> _mapOfObjects = List<Map<String, dynamic>>.empty(growable: true);
  String? _apiAuthToken;

  @override
  String toString() {
    print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
    return 'Count is: $_count, Message: $_message, Object List: ${_list.toString()}';
  }

  HtpResponse(msg, count, array, token, api) {
    _api = api;
    _message = msg;
    _count = count;
    _apiAuthToken = token;
    _list = array;
    print('>>>>> DEBUG: PhpMySqlResponse()... ${_list.length} records returned.');
    _list.forEach((element) {
      _mapOfObjects.add(element);
    });
  }

  HtpResponse.empty() {
    _message = '';
    _count = 0;
    _list = List<dynamic>.empty(growable: true);
    _mapOfObjects = List<Map<String, dynamic>>.empty(growable: true);
  }

  List<Map<String, dynamic>> getObjects() {
    print('>>>>>>>>>>> _list<dynamic>.length = ${_list.length}');
    print('>>>>>>>>>>> _mapOfObjects.length = ${_mapOfObjects.length}');
    return _mapOfObjects;
  }

  String getApiName() => _api;

  String? getApiAuthToken() {
    return _apiAuthToken;
  }

  int getCount() {
    return _mapOfObjects.length;
  }

  String getMessage() {
    return _message;
  }
}