import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=5337d8e0-ad0f-422f-a015-cecbb7968e5f'));
  print(response.body);
  print(response.statusCode);
}

// void main() async{
//   var data = {'title': 'My first post'};
//   var sentresponse = await http.get(
//     Uri.parse('https://ems-mgmt.coinapi.io/v1/exchangerate/BTC/USD'),
//     headers: {'Accept': 'application/json', 'X-CoinAPI-Key': '5337d8e0-ad0f-422f-a015-cecbb7968e5f'}
//   );
//   print(sentresponse.statusCode);
//   print('this was fun');
// }