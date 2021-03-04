import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:integracja/models/api_item.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/network/api_exception.dart';

class ApiBase {
  final String _baseUrl = "https://integracja-api.azurewebsites.net";
  final Map<String, String> _header;
  ApiBase({@required User user})
      : assert(user != null),
        _header = {
          'Content-Type': 'application/json',
          'accept': 'text/plain',
          'Authorization': 'Bearer ${user.token}'
        } {
    log(user.token);
  }

  String _urlResolver(API path) {
    switch (path) {
      case API.Auth:
        return _baseUrl + '/api/Auth/Login';
      case API.Games:
        return _baseUrl + '/api/Games';
      case API.Games_Accept:
        return _baseUrl + '/api/Games/Accept';
      case API.Games_Join:
        return _baseUrl + '/api/Games/Join';
      case API.Games_Leave:
        return _baseUrl + '/api/Games/Leave';
      case API.Games_MyGames:
        return _baseUrl + '/api/Games/MyGames';
      case API.Games_Play:
        return _baseUrl + '/api/Games/Play';
      case API.Questions:
        return _baseUrl + '/api/Questions';
      default:
        return _baseUrl;
    }
  }

  Future<dynamic> request(
      {@required RequestType requestType,
      @required API api,
      User user,
      ApiRequest transferObject,
      int id}) async {
    switch (requestType) {
      case RequestType.GET:
        return _get(
            url: _urlResolver(api), transferObject: transferObject, id: id);
      case RequestType.POST:
        return _post(url: _urlResolver(api), transferObject: transferObject);
      case RequestType.DELETE:
        return _delete(url: _urlResolver(api), transferObject: transferObject);
      case RequestType.PUT:
        return _put(url: _urlResolver(api), transferObject: transferObject);
    }
  }

  Future<dynamic> _get(
      {@required String url, ApiRequest transferObject, int id}) async {
    var response =
        await http.get(url + (id != null ? "/$id" : ""), headers: _header);
    log(url);
    log(response.request.toString());
    log(response.body);
    log(response.statusCode.toString());
    return _returnResponse(response);
  }

  Future<dynamic> _post(
      {@required String url, ApiRequest transferObject}) async {
    var response = await http.post(url,
        headers: _header, body: jsonEncode(transferObject.toJson()));
    return _returnResponse(response);
  }

  Future<dynamic> _put({@required String url, dynamic transferObject}) async {}
  Future<dynamic> _delete(
      {@required String url, dynamic transferObject}) async {}

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseDecoded = json.decode(response.body);
        return responseDecoded;
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
    }
  }
}

enum API {
  Auth,
  Games,
  Games_Accept,
  Games_Join,
  Games_Leave,
  Games_MyGames,
  Games_Play,
  Questions
}
enum RequestType { GET, POST, PUT, DELETE }
