import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coin_repository.dart';
import 'package:dio/dio.dart';
import 'models/crypto_coin.dart';

class CryptoCoinsRepository implements AbstractCoinRepository{

  final Dio dio;
  CryptoCoinsRepository({
    required this.dio,
  });
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD,JPY,EUR',
    );

    final data = response.data as Map<String, dynamic>;
    final rawData = data['RAW'] as Map<String, dynamic>;

    // final btcData = rawData['BTC'] as Map<String, dynamic>;
    final cryptoCoinsList =rawData.entries.map((entry) {
      final usdData = (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'] as num;
      final image = usdData['IMAGEURL'];
      final imageURL = 'https://www.cryptocompare.com$image';
      return CryptoCoin(name: entry.key, priceInUSD: price.toDouble(), image: imageURL);
    }).toList();

    return cryptoCoinsList;
  }
}
