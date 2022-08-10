import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '41ACA103-11C3-44E2-A9A7-1C471BD8706B';
// const apiKey = '6252BADA-F482-40EF-BAD0-DA390813441E';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getData({targetcurrency, sourceCurrency}) async {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$sourceCurrency/$targetcurrency?apiKey=$apiKey';

    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = response.body;
      dynamic decodeData = jsonDecode(data);
      print(decodeData['rate']);
      double rate = decodeData['rate'];
      return rate;
    } else {
      print('Request failed with source code ${response.statusCode}');
      return 0;
    }
  }

  Future<List<double>> updateTargetPrice(targetCurrency) async {
    List<double> targetPrices = [];
    for (var element in cryptoList) {
      targetPrices.add(
        await getData(
          targetcurrency: targetCurrency,
          sourceCurrency: element,
        ),
      );
    }
    return targetPrices;
  }
}
