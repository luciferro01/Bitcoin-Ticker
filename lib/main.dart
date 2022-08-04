// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin.dart';

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
      onChanged: (value) {
        // print(value);
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
      // backgroundColor: Colors.blueAccent,
      magnification: 1.1,
      looping: true,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        print(value);
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
    // getrates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bitcoin Ticker',
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
            Card(
              shadowColor: Colors.red,
              elevation: 6,
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BTC ==  $selectedCurrency => ${currency}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.blueAccent,
              // child: androidPicker(),
              child: picker(),
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