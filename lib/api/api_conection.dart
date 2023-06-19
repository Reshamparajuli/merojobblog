import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response_model.dart';

class API {
  Future<APIResponseModel?> getPost(String slug) async {
    String url = 'http://192.168.99.20/api/v1/blog/posts/$slug/';
    print(url);
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      APIResponseModel responseModel =
          APIResponseModel.fromJson(json.decode(response.body));
      return responseModel;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
