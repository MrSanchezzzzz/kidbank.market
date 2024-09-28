import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../env/env.dart';
class Requests{

  static Future<Map<String, dynamic>> login({required String login,required String password}) async{
    final String url='${Env.apiKey}/api/auth/signin';
    Response response= await _makePostRequest(
        url: url,
        body: {
          'email':login,
          'password':password
        }
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String? surname,
    String? phone,
    String role='parent'
  }) async
  {
    final String url='${Env.apiKey}/api/auth/signup';
    Response response= await _makePostRequest(
        url: url,
        body: {
          'firsName':name,
          'email':email,
          'password':password,
          'role':role
        }
    );
    return jsonDecode(response.body);
  }


  
  static Future<Response> _makePostRequest({required String url,Map<String,String>? headers,Object? body}) async{
    try {
      Response response = await post(Uri.parse(url), headers: headers, body: body);
      if(response.statusCode==200){
        return response;
      }
      else{
        throw Exception('Failed http call. status: ${response.statusCode}');
      }
    }catch(error,_){
      print('Error making POST request: $error');
      return Response('Error', 404);

    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}