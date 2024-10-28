import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test_webview/constants.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Services {
  Services();

  Future<String?> getSessionId() async {
    try {
      String url = "${Constants.baseUrl}/sessions";
      Map<String, dynamic> sessionData = {
        'screen_height': 800,
        'screen_width': 600,
        'analytics_accepted': true,
        'anonymous_id': const Uuid().v4()
      };
      Map<String, String> headers = {
        "accept": "*/*",
        "content-type": "application/json"
      };
      var response = await http.post(
        Uri.parse(url),
        body: json.encode(sessionData),
        headers: headers,
      );

      debugPrint("Sessions Response\n${response.body}");

      if (response.statusCode < 300 && response.statusCode >= 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        return responseData["session_id"];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
