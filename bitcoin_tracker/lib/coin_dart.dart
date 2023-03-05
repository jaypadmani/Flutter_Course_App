import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = '4F865A0C-3F03-406B-993A-186063DF129D';

class CoinData {
  Future getcoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestUrl = '$coinApiURL/$crypto/$currency?apikey=$apikey';
      http.Response response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        var decodedata = jsonDecode(response.body);

        var lastPrice = decodedata['rate'];

        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get Request';
      }
    }
    return cryptoPrices;
  }
}
