import 'dart:io';

import 'package:carousel_ui_assignment/services/api_url_endpoint.dart';
import 'package:chopper/chopper.dart';

import 'package:http/io_client.dart' as http;

part 'api_services.chopper.dart';
@ChopperApi(baseUrl: '')
@ChopperApi()
abstract class ApiService extends ChopperService {
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static ApiService create() {
    final client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 60),
      ),
      baseUrl: baseUrl,
      //services: [_$ApiService()],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Get(path: API_ENDPOINT.getData)
  Future<Response> getAllData();


}
