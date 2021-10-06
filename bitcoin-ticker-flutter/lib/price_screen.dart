import 'dart:convert';
import 'dart:io';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  int btcUsd = 0;
  String selectedItem = 'USD';

  void getExchangeRates() async {
    Response response = await get('$baseURL/BTC/$selectedItem?apikey=$apiKey');
    if (response.statusCode == 200) {
      setState(() {
        double rate = jsonDecode(response.body)['rate'];
        btcUsd = rate.toInt();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getExchangeRates();
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
                  '1 BTC = $btcUsd $selectedItem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid
                ? DropdownButton(
                    value: selectedItem,
                    items: currenciesList
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value;
                      });
                      getExchangeRates();
                    },
                  )
                : CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedItem = currenciesList[index];
                      });
                    },
                    children: currenciesList.map((e) => Text(e)).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
