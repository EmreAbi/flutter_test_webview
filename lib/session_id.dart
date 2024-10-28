import 'package:flutter_webview_test/services.dart';

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
