import 'dart:convert';

import 'package:http/http.dart' as http;
Future<Map<dynamic, dynamic>> getRequest(String url,) async {
  try {
    var response = await http.get(Uri.parse(url), headers: {
      "Content-type": "application/json",
      "Accept":"application/json",
    });
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      return {"error": response.statusCode};
    }
  } catch (e) {
    return {"error": e};
  }
}
/*
Future<Map<dynamic, dynamic>> postRequest2(String url, Map map) async {
  try {
    var response = await http.post(Uri.parse(url), body: json.encode(map), headers: {
      "Content-type": "application/json",
      "Accept":"application/json",
    });
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      var responsebody = jsonDecode(response.body);
      if (responsebody.containsKey('errors') && responsebody['errors'].containsKey('email')) {
        return {'error': responsebody['errors']};
      } else {
        return {'error': 'Unrecognized error occurred'};
      }
    }
  } catch (e) {
    return {'error': 'Error occurred: ${e.toString()}'};
  }
}
*/

Future<Map<dynamic, dynamic>> postRequest(String url, Map map) async {
  try {
    var response =
    await http.post(Uri.parse(url), body: json.encode(map), headers: {
      'Content-Type':'application/json',
      // 'Authorization':'Bearer $token',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      print(response.statusCode.toString());
      return {"error": response.statusCode};
    }
  } catch (e) {
    print(e.toString());
    return {"error": e};
  }
}
