import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: SvgPicture.asset('assets/svg/bitcoin.svg', height: 25, width: 25,),
        title: Text(
          coinName,
          style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text(
          '20000',
          style: Theme.of(context).textTheme.labelSmall
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pushNamed('/coin', arguments: coinName,);
        },
      );
  }
}