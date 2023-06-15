import 'dart:convert';

import 'package:http/http.dart' as http;
// Future<Map<dynamic, dynamic>> postRequest(String url, Map map) async {
//   try {
//     var response = await http.post(Uri.parse(url), body: json.encode(map), headers: {
//       "Content-type": "application/json",
//       "Accept":"application/json",
//     });
//     if (response.statusCode == 200) {
//       var responsebody = jsonDecode(response.body);
//       return responsebody;
//     } else {
//       return {"error": response.statusCode};
//     }
//   } catch (e) {
//     return {"error": e};
//   }
// }
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
Future<Map<dynamic, dynamic>> getRequest(String url) async {
  try {
    http.Response response = await http
        .get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      // print(response.body);
      return responseBody;
    } else {
      return {'error': response.statusCode};
    }
  } catch (e) {
    return {"error": e};
  }
}

Future<Map<dynamic, dynamic>> postRequest(String url, Map map) async {
  try {
    var response =
    await http.post(Uri.parse(url), body: json.encode(map), headers: {
      'Content-Type':'application/json',
      // 'Authorization':'Bearer $token',
    });
    print("response: ${response.body}");
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


Future<Map<String, dynamic>> apiPut({url, body,}) async {
  try {
    var response = await http.put(Uri.parse('$url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(body));

    if (response.statusCode == 401) {}
    if (response.statusCode == 403) {}
    if (response.statusCode == 200) {
      return {'response': response.statusCode};
    }

    return {'error': response.body};
  } catch (e) {
    return {'error': e};
  }
}
Future<Map<String, dynamic>> apiDelete(url) async {
  try {
    var response =
    await http.delete(Uri.parse('$url'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 401) {}
    if (response.statusCode == 403) {}
    if (response.statusCode == 200) {
      return {'response': response.statusCode};
    }

    return {'error': response.statusCode};
  } catch (e) {
    return {'error': e};
  }
}
