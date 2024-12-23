// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_test_webview/constants.dart';
import 'package:flutter_test_webview/session_id.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestWebviewPage extends StatefulWidget {
  final String? url;
  final Map<String, String> headers;
  final String method;

  const TestWebviewPage({
    super.key,
    this.url,
    this.headers = const <String, String>{},
    this.method = 'get',
  });

  @override
  State<TestWebviewPage> createState() => _TestWebviewPageState();
}

class _TestWebviewPageState extends State<TestWebviewPage> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      String sessionId = await SessionIdManager().sessionId ?? Constants.url;
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(),
        )
        ..loadRequest(
          Uri.parse(widget.url ?? Constants.pageUrl(sessionId)),
          headers: widget.headers,
        );
      // controller.addJavaScriptChannel(name, onMessageReceived: onMessageReceived);
      // controller.runJavaScript(javaScript);
      // controller.runJavaScriptReturningResult(javaScript)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
