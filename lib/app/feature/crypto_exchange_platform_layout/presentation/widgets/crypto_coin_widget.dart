import 'package:dart_and_flutter_examples_app/app/feature/crypto_exchange_platform_layout/domain/crypto_coin.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class CryptoCoinWidget extends StatefulWidget {
  const CryptoCoinWidget({
    super.key,
    required this.name,
    required this.indexChange24h,
    required this.price,
  });

  final CryptoCoin name;
  final Decimal price;
  final double indexChange24h;

  @override
  State<CryptoCoinWidget> createState() => _CryptoCoinWidgetState();
}

class _CryptoCoinWidgetState extends State<CryptoCoinWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
