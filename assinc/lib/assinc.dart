import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<dynamic>> responseAsync(String url) async{
  try{
    var response = await http.get(Uri.parse(url));
    List<dynamic> lista = json.decode(response.body);
    return lista;
  }catch(error){
    print("Error ao buscar dados");
    return [];
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

sendDataAsync(Map<String, dynamic> mapAccount, url) async{
 List<dynamic> listAccount = await responseAsync(url);
 if (listAccount.isEmpty){
  print("Não foi possível enviar o dado inserido");
  return null;
 }
 
 listAccount.add(mapAccount); 
 String content = json.encode(listAccount);
 http.Response response = await http.post(Uri.parse(url), body: content);
print(response.body);

}