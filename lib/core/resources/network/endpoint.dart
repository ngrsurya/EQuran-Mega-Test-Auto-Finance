class Endpoint {
  final String baseUrl;

  Endpoint(String status)
      : baseUrl =
            status == 'DEV' ? "https://equran.id/api" : "https://equran.id/api";
}
