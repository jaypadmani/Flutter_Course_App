import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_dart.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'AUD';

  DropdownButton<String> androiddropdownItem() {
    List<DropdownMenuItem<String>> dropdownitem = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitem.add(newItem);
    }

    return DropdownButton(
      value: selectedCurrency,
      items: dropdownitem,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData(selectedCurrency!);
        });
      },
    );
  }

  CupertinoPicker isoPickerItem() {
    List<Text> pickerItem = [];

    for (String currency in currenciesList) {
      Text newItem = Text(currency);
      pickerItem.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItem,
    );
  }

  Map<String, String> coinValue = {};
  bool isWaiting = false;

  void getData(String changecurrency) async {
    isWaiting = true;
    try {
      var data = await CoinData().getcoinData(changecurrency);

      isWaiting = false;
      setState(() {
        coinValue = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData(selectedCurrency!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                cryptoCurrency: 'BTC',
                value: isWaiting ? '?' : coinValue['BTC'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'ETH',
                value: isWaiting ? '?' : coinValue['ETH'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'LTC',
                value: isWaiting ? '?' : coinValue['LTC'],
                selectedCurrency: selectedCurrency,
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 364),
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? isoPickerItem() : androiddropdownItem(),
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {

  final String? value;
  final String? selectedCurrency;
  final String? cryptoCurrency;
  const CryptoCard({this.value,this.selectedCurrency,this.cryptoCurrency});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

