// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class NetworkHelper {
//   NetworkHelper(this.url);
//   final String url;
//
//   Future getData() async {
//     http.Response response = await http.get(Uri.parse(url));
//
//     return response.statusCode == 200
//         ? jsonDecode(response.body)
//         : print(response.statusCode);
//   }
// }
