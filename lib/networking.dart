// import 'dart:ffi';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // const apiKey = '41ACA103-11C3-44E2-A9A7-1C471BD8706B';
// const apiKey = '6252BADA-F482-40EF-BAD0-DA390813441E';

// class Networking {
//   // final String currency;
//   // Networking(this.currency);

//   String currency = 'USD';
//   Future<num> getrates(String getcurrency) async {
//     String url =
//         'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apiKey=$apiKey';

//     http.Response response = await http.get(Uri.parse(url));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var data = response.body;
//       dynamic decodeData = jsonDecode(data);
//       print(decodeData['rate']);
//       double rate = await decodeData['rate'];
//       return rate;
//     } else {
//       print('Request failed');
//       return 0;
//     }
//   }
// }
