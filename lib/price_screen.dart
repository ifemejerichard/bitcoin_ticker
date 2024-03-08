import 'dart:convert';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/constants.dart';


class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  var btcPrice;
  var ethPrice;
  var ltcPrice;

  void initState(){
    super.initState();
    getCurrencyInfo(selectedCurrency);
  }

  void getCurrencyInfo(String currency) async{

    CoinData coinData = CoinData(currencyType: currency);

    var btcInfo = await coinData.getBtcInfo();
    var ethInfo = await coinData.getEthInfo();
    var ltcInfo = await coinData.getLtcInfo();

    setState(() {
      btcPrice = (jsonDecode(btcInfo)['rate']).toInt();
      ethPrice = (jsonDecode(ethInfo)['rate']).toInt();
      ltcPrice = (jsonDecode(ltcInfo)['rate']).toInt();
    });
  }

  //rate.value

  Widget setUpDropDown(){
    // I needed to be very specific about the List type(<DropdownMenuItem<String>>) else the item at the bottom wont accept it
    // we could also use a for in loop
    List <DropdownMenuItem<String>>dropDownItems = [];
    for(int i = 0; i < currenciesList.length; i++){
      String currency = currenciesList[i];
      var newItems = DropdownMenuItem(child: Text(currency, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)), value: currency,
      );
      dropDownItems.add( newItems);
    }

    var result = DropdownButton<String>(value: selectedCurrency, // the usd means it is the default value before the use selects an item
        items: dropDownItems,
        onChanged: (value){
          setState(() {
            selectedCurrency = value!; // the exclamation mark is a null checker
            getCurrencyInfo(selectedCurrency);
          });
        }
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 BTC = ${btcPrice ?? 0} $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ETH = ${ethPrice ?? 0} $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 LTC = ${ltcPrice} $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: setUpDropDown(),
          ),
        ],
      ),
    );
  }
}

