import 'dart:convert';

import 'package:http/http.dart' as http;

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
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '344C6311-B980-4879-B4D2-78E5981CAD9D';

class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL = '$coinAPIURL/$crypto/$currency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestURL));
      (response.statusCode == 200)
          ? cryptoPrices[crypto] =
              jsonDecode(response.body)['rate'].toStringAsFixed(0)
          : throw '${response.statusCode} Problem with the get request';
    }
    return cryptoPrices;
  }
}
// class CoinData {
//   CoinData(this.url);
//   final String url;
//
//   Future getData() async {
//     http.Response response = await http.get(Uri.parse(url));
//     return response.statusCode == 200
//         ? jsonDecode(response.body)['rate'].round()
//         : print(response.statusCode);
//   }
