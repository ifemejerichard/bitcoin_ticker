import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/constants.dart';

class CoinData {

  late String currencyType;

  CoinData({required this.currencyType});

  Future getBtcInfo () async{
    var sentResponse = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/${cryptoList[0]}/${currencyType}?apikey=${apikey}'));
    //print(sentResponse.body);
    //print(sentResponse.statusCode);

    if (sentResponse.statusCode == 200){
      return sentResponse.body;
    }
    else{
      print('we got an error code');
      return;
    }
  }

  Future getEthInfo () async{
    var sentResponse = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/${cryptoList[1]}/${currencyType}?apikey=${apikey}'));
    //print(sentResponse.body);
    //print(sentResponse.statusCode);

    if (sentResponse.statusCode == 200){
      return sentResponse.body;
    }
    else{
      print('we got an error code');
      return;
    }
  }

  Future getLtcInfo () async{
    var sentResponse = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/${cryptoList[2]}/${currencyType}?apikey=${apikey}'));
    //print(sentResponse.body);
    //print(sentResponse.statusCode);

    if (sentResponse.statusCode == 200){
      return sentResponse.body;
    }
    else{
      print('we got an error code');
      return;
    }
  }
}