import 'package:http/http.dart' as http;
import 'dart:convert';

void responseAsync(String url) async{
  try{
    var response = await http.get(Uri.parse(url));
    print(response.headers);
    print(response.statusCode);
    List<dynamic> lista = json.decode(response.body);
    for (var value in lista) {
      print(value);
    }
  }catch(error){
    print("Error ao buscar dados");
  }
    
} 
void response(String url){
  Future<http.Response> responseFuture = http.get(Uri.parse(url));
    responseFuture.then(
      (http.Response response){
        print(response.headers);
        print(response.statusCode);
        List<dynamic> lista = json.decode(response.body);
        for (var value in lista) {
          print(value);
        }
      }
    ).catchError(
      (error) {print("Erro ao buscar dados!");}
    );
} 