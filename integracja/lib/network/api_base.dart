import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/models/api_item.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/network/api_exception.dart';

class ApiBase {
  final String _baseUrl = "https://integracja-api.azurewebsites.net";
  final authenticationController = Get.find<AuthenticationController>();
  Map<String, String> _header() {
    if (authenticationController.state is Authenticated) {
      _tokenRefreshIfNeeded();
      User user = (authenticationController.state as Authenticated).user;
      //log(user.token);
      return {
        'Content-Type': 'application/json',
        'accept': 'text/plain',
        'Authorization': 'Bearer ${user.token}'
      };
    } else {
      return {'Content-Type': 'application/json', 'accept': 'text/plain'};
    }
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
      case API.Users_Games:
        return _baseUrl + '/api/Users/Games';
      case API.Users_GamesArchived:
        return _baseUrl + '/api/Users/GamesArchived';
      case API.Questions:
        return _baseUrl + '/api/Questions';
      case API.History:
        return _baseUrl + '/api/Games/History';
      default:
        return _baseUrl;
    }
  }

  Future<dynamic> request(
      {@required RequestType requestType,
      @required API api,
      User user,
      ApiRequest transferObject,
      List<int> answerId,
      int id,
      String uuid,
      int secondId}) async {
    switch (requestType) {
      case RequestType.GET:
        return _get(
            url: _urlResolver(api),
            transferObject: transferObject,
            id: id,
            uuid: uuid);
      case RequestType.POST:
        return _post(
            url: _urlResolver(api),
            transferObject: transferObject,
            id: id,
            secondId: secondId,
            answerId: answerId);
      case RequestType.DELETE:
        return _delete(url: _urlResolver(api), transferObject: transferObject);
      case RequestType.PUT:
        return _put(url: _urlResolver(api), transferObject: transferObject);
    }
  }

  Future<dynamic> _get(
      {@required String url,
      ApiRequest transferObject,
      int id,
      String uuid}) async {
    var response = await http
        .get(
            Uri.parse(url +
                (uuid != null ? "/$uuid" : "") +
                (id != null ? "/$id" : "")),
            headers: _header())
        .timeout(Duration(seconds: 15));
    //log(response.body);
    return _returnResponse(response);
  }

  Future<dynamic> _post(
      {@required String url,
      ApiRequest transferObject,
      int id,
      String uuid,
      int secondId,
      List<int> answerId}) async {
    var response = await http
        .post(
            Uri.parse(url +
                (id != null ? "/$id" : "") +
                (uuid != null ? "/$uuid" : "") +
                (secondId != null ? "/$secondId" : "")),
            headers: _header(),
            body: answerId != null
                ? answerId.toString()
                : jsonEncode(transferObject.toJson()))
        .timeout(Duration(seconds: 15));
    return _returnResponse(response);
  }

  Future<dynamic> _put({@required String url, dynamic transferObject}) async {}
  Future<dynamic> _delete(
      {@required String url, dynamic transferObject}) async {}

  Future<bool> _tokenRefreshIfNeeded() async {
    User user = (authenticationController.state as Authenticated).user;
    if (user.validTo.isBefore(DateTime.now().toUtc())) {
      await authenticationController.getUserFromSystem();
      return true;
    }
    return true;
  }

  dynamic _returnResponse(http.Response response) {
    //log('Response body: ${response.body}');
    switch (response.statusCode) {
      case 200:
        var _response = json.decode(response.body);
        return _response;
      case 400:
        throw BadRequestException();
      case 401:
        Get.find<AuthenticationController>().signOut();
        Get.back();
        throw UnauthorizedException();
      case 409:
        var _response = json.decode(response.body);
        throw PlayException(_response['ErrorCode'], _response['Message']);
    }
  }
}

enum API {
  Auth,
  Games_Join,
  Games_Leave,
  Games_Play,
  Users_Games,
  Users_GamesArchived,
  Games,
  Games_Accept,
  Games_MyGames,
  Questions,
  History,
}
enum RequestType { GET, POST, PUT, DELETE }
