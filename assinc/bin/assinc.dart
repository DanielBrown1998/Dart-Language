import 'package:assinc/assinc.dart';
void main() {
  String url = 'https://gist.githubusercontent.com/DanielBrown1998/2e08120282bc3f5c4160b6ba56b2cef1/raw/528d5e9dcafd230b537d7ef48dd1f35da638aa5a/accounts.json';
  response(url);
  Map<String, dynamic> newUser = {
    "id": "NEW001",
    "name": "Daniel",
    "lastName": "Passos", 
    "balance": "7000"
  };
  sendDataAsync(newUser, url);

}


