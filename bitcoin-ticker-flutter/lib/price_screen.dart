// ignore_for_file: sdk_version_ui_as_code

import 'dart:convert';
import 'dart:io';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Map<String, int> coinValues = {};
  Map<String, bool> coinLoading =
      Map.fromIterable(cryptoList, key: (v) => v, value: (v) => false);
  String selectedItem = 'USD';

  void getExchangeRates() async {
    for (String coin in cryptoList) {
      coinLoading.addAll({coin: true});
      Response response = await get(
        '$baseURL/$coin/$selectedItem?apikey=$apiKey',
      );
      if (response.statusCode == 200) {
        setState(() {
          double rate = jsonDecode(response.body)['rate'];
          coinValues.addAll({coin: rate.toInt()});
          coinLoading.addAll({coin: false});
        });
      }
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
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...cryptoList
                    .map(
                      (crypto) => Padding(
                        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                        child: Card(
                          color: Colors.lightBlueAccent,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 28.0),
                            child: coinValues[crypto] != null &&
                                    !coinLoading[crypto]
                                ? Text(
                                    '1 $crypto = ${coinValues[crypto]} $selectedItem',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  )
                                : SpinKitChasingDots(
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
