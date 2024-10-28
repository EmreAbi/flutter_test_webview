class Constants {
  static const String url =
      'https://test-app.myfootprint.app/?theme=Podolino&flow=SELF-DEFAULT-PDP&session=116f4a71-ca40-439c-810e-fbb98eb137dcd&gdpr=1&lang-select=1';

  static String pageUrl(String sessionId) =>
      "https://test-app.myfootprint.app/?theme=Podolino&flow=SELF-DEFAULT-PDP&session=$sessionId&gdpr=1&lang-select=1";
  static const String baseUrl = "https://test-backend.myfootprint.app";
}
