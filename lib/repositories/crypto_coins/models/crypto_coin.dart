class CryptoCoin {
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.image
  });

  final String name;
  final double priceInUSD;
  final String image;

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      name: json['name'] as String,
      priceInUSD: (json['priceInUSD'] as num).toDouble(),
      image: json['image'] as String,
    );
  }
}
