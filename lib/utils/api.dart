import 'dart:convert';
import 'package:code4odisha/buttons/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/login');
  static var responseJson;

  static login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString('password', password);
      pref.setString('email', email);
      pref.setString('uName', responseJson['uName']);
      pref.setString('tName', responseJson['tName']);
      pref.setString('uid', responseJson['uid']);
      pref.setString('tid', responseJson['tid']);
      pref.setString('table', responseJson['table']);
      pref.setString('probStatement', responseJson['probStatement']);

      pref.setString('m1Name', responseJson['m1Name']);
      pref.setString('m2Name', responseJson['m2Name']);

      if (responseJson['m3Name'] != null) {
        pref.setString('m3Name', responseJson['m3Name']);
      }
      if (responseJson['m4Name'] != null) {
        pref.setString('m4Name', responseJson['m4Name']);
      }
      if (responseJson['lName'] != null) {
        pref.setString('lName', responseJson['lName']);
      }
      print(pref.getString('uName'));
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const navigate(),
        ),
      );
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class Issue {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/issue');

  static issues(memID, teamID, problem, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({'mid': memID, 'tid': teamID, 'p': problem}));

    if (response.statusCode == 200) {
      await EasyLoading.showSuccess(response.body);
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class LoginHelp {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/loginIssue');

  static issues(email, tName, problem, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({'email': email, 'tName': tName, 'msg': problem}));

    if (response.statusCode == 200) {
      await EasyLoading.showSuccess(response.body);
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class Feed {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/feedback');

  static issues(email, tName, message, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({'email': email, 'tName': tName, 'msg': message}));

    if (response.statusCode == 200) {
      await EasyLoading.showSuccess(response.body);
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class QrData {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/c4oQR');

  static sendQr(qrCode, userID, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({'qrStr': qrCode, 'uid': userID}));

    if (response.statusCode == 200) {
      await EasyLoading.showSuccess(response.body,
          dismissOnTap: true, duration: const Duration(seconds: 20));
    } else {
      await EasyLoading.showError("Error ${response.body}",
          dismissOnTap: true, duration: const Duration(seconds: 20));
    }
  }
}

class TeamList {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/getStatus');

  static getList(tid) async {
    http.Response response =
        await _client.post(_loginUrl, body: jsonEncode({'tid': tid}));

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('status', responseJson['status']);
      pref.setString('teams', responseJson['teams']);
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class Broadcast {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/getBroadcast');

  static getcast() async {
    http.Response response =
        await _client.get(_loginUrl);

    print(response.body);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('broadcast', responseJson['msg']);
    } else {
      await EasyLoading.showError("Error");
    }
  }
}
