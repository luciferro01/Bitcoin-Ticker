// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin.dart';
import 'resuable_cards.dart';

// const apiKey = '41ACA103-11C3-44E2-A9A7-1C471BD8706B';
const apiKey = '6252BADA-F482-40EF-BAD0-DA390813441E';
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const BitcoinTicker(),
    );
  }
}

class BitcoinTicker extends StatefulWidget {
  const BitcoinTicker({Key? key}) : super(key: key);

  @override
  State<BitcoinTicker> createState() => _BitcoinTickerState();
}

class _BitcoinTickerState extends State<BitcoinTicker> {
  String currency = 'USD';
  String selectedCurrency = 'USD';
  String crypto = 'BTC';
  List<ResuableCard> cardString = [];
  CoinData coinData = CoinData();
  List<double> targetPrice = [];

  Future<void> updatePrice() async {
    List<double> ListofTargetPrice = await coinData.updateTargetPrice(currency);
    setState(() {
      targetPrice = ListofTargetPrice;
    });
  }

  List<ResuableCard> getCards() {
    cardString = [];
    for (int i = 0; i < cryptoList.length; i++) {
      ResuableCard cryptoCard = ResuableCard(
        currency: targetPrice[i],
        selectedCurrency: selectedCurrency,
        crypto: cryptoList[i],
      );
      cardString.add(cryptoCard);
    }
    return cardString;
  }

  DropdownButton androidPicker() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (var i in currenciesList) {
      var newItem = DropdownMenuItem(
        value: i,
        child: Text(i),
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) async {
        // print(value);
        await updatePrice();
        setState(() {
          selectedCurrency = value!;
          currency = value;
          // Networking().getrates(currency);
          // getrates();
          // Networking(currency);
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Widget> pickerItems = [];
    for (var i in currenciesList) {
      var items = Text(i);
      pickerItems.add(items);
    }
    return CupertinoPicker(
      backgroundColor: Colors.blueAccent,
      magnification: 1.1,
      looping: true,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) async {
        // print(value);
        currency = currenciesList[value];
        selectedCurrency = currenciesList[value];
        await updatePrice();
        // setState(() {
        //   // currency =
        // });
      },
      children: pickerItems,
    );
  }

  dynamic picker() {
    if (Platform.isIOS) {
      return iosPicker();
    } else if (Platform.isAndroid) {
      return androidPicker();
    }
    // return iosPicker();
  }

  @override
  void initState() {
    super.initState();
    updatePrice();
    for (var i = 0; i < cryptoList.length; i++) {
      targetPrice.add(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🤑 Bitcoin Ticker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: getCards(),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.blueAccent,
              // child: androidPicker(),
              // child: picker(),
              child: iosPicker(),
            )
          ],
        ),
      ),
    );
  }
}

// List<DropdownMenuItem<String>> getDropdownItems() {List<DropdownMenuItem<String>> dropDownItems = [];
// for (var i in currenciesList) {
//   var newItem = DropdownMenuItem(
//     value: i,
//     child: Text(i),
//   );
//   dropDownItems.add(newItem);
// }
// return dropDownItems;

// }

// List<Widget> getPickerItems() {
//   List<Widget> pickerItems = [];
//   for (var i in currenciesList) {
//     var items = Text(i);
//     pickerItems.add(items);
//   }
//   return pickerItems;
// }
