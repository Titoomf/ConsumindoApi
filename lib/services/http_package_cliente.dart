import 'dart:convert';

import 'package:http/http.dart ' as http;

import 'http_client_interfaces.dart';

class HttpPackageCliente implements IHttpClient {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));

    return jsonDecode(response.body);
  }
}
