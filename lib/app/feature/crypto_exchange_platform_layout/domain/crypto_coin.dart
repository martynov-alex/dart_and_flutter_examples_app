enum CryptoCoin {
  bitcoin('Bitcoin', 'BTC'),
  ripple('Ripple', 'XRP'),
  binanceCoin('Binance Coin', 'BNB'),
  ethereum('Ethereum', 'ETH'),
  ;

  const CryptoCoin(this.name, this.ticker);

  final String name;
  final String ticker;
}
