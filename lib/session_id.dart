import 'package:flutter_test_webview/services.dart';

class SessionIdManager {
  static final SessionIdManager _manager = SessionIdManager._internal();

  factory SessionIdManager() {
    return _manager;
  }

  SessionIdManager._internal();

  String? _sessionId;

  Future<String?> get sessionId async =>
      _sessionId ?? (await Services().getSessionId());
}
