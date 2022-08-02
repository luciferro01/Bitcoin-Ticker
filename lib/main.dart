// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin.dart';
import 'dart:io' show Platform;

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
      home: BitcoinTicker(),
    );
  }
}

class BitcoinTicker extends StatefulWidget {
  @override
  State<BitcoinTicker> createState() => _BitcoinTickerState();
}

class _BitcoinTickerState extends State<BitcoinTicker> {
  // const BitcoinTicker({Key? key}) : super(key: key);
  String selectedCurrency = 'INR';

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
        });
      },
    );
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

  // List<Widget> getPickerItems() {
  //   List<Widget> pickerItems = [];
  //   for (var i in currenciesList) {
  //     var items = Text(i);
  //     pickerItems.add(items);
  //   }
  //   return pickerItems;
  // }

  dynamic picker() {
    if (Platform.isIOS) {
      return iosPicker();
    } else if (Platform.isAndroid) {
      return androidPicker();
    }
    // return iosPicker();
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
                      selectedCurrency,
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
