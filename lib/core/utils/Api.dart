import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
// final _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
//   final Dio dio = Dio() ;
 
//   Future<Map<String, dynamic>> get({required String endPoint}) async {
//     var response = await dio.get('$_baseUrl?$endPoint');

//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       throw Exception(
//           'there is an error with status code : ${response.statusCode}');
//     }
//   }





 Future<dynamic> get({required String url})async{

  http.Response response =await http.get(Uri.parse(url));
 
  if(response.statusCode == 200){

    return jsonDecode(response.body);
  }else {
    throw Exception(
       'there is an error with status code : ${response.statusCode}'
    );
  }
 }

 Future<dynamic> post ({required String url}) async{

  http.Response response = await http.post(Uri.parse(url));

  if (response.statusCode == 200){

     return jsonDecode(response.body);
  }else{
    throw Exception(
       'there is an error with status code : ${response.statusCode}'
    );
  }
 }

 
 Future<dynamic> put ({required String url}) async{

  http.Response response = await http.put(Uri.parse(url));

  if (response.statusCode == 200){

     return jsonDecode(response.body);
     
  }else{
    throw Exception(
       'there is an error with status code : ${response.statusCode}'
    );
  }
 }





}