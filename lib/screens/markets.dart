import 'package:ecoin/screens/home_details.dart';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:ecoin/widgets/dash.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Markets',
                style: kHeadingTextStyle,
              ),
              SizedBox(height: 6),

              /// Search bar
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: const Color(0xff3A3C40),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: const Color(0xff3A3C40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    child: Icon(
                      isGrid ? Icons.menu : Icons.grid_on,
                      color: const Color(0xff505053),
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Currency',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Price/Vol',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '24hr change',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: const Color(0xff3A3C40),
                height: 0,
              ),

              /// CryptoCoin List
              Expanded(
                child: isGrid
                    ? ListView(
                        children: [
                          CustomGridView(
                            child1: MarketCryptoGridListTile(
                              name: 'BTC',
                              val1: 9293.74,
                              val2: 0.24,
                            ),
                            child2: MarketCryptoGridListTile(
                              name: 'ETH',
                              val1: 233.14,
                              val2: -1.27,
                            ),
                          ),
                          CustomGridView(
                            child1: MarketCryptoGridListTile(
                              name: 'LTC',
                              val1: 43.84,
                              val2: 0.04,
                            ),
                            child2: MarketCryptoGridListTile(
                              name: 'DASH',
                              val1: 233.14,
                              val2: -3.27,
                            ),
                          ),
                          CustomGridView(
                            child1: MarketCryptoGridListTile(
                              name: 'LTC',
                              val1: 43.84,
                              val2: 0.04,
                            ),
                            child2: MarketCryptoGridListTile(
                              name: 'DASH',
                              val1: 233.14,
                              val2: -3.27,
                            ),
                          ),
                          CustomGridView(
                            child2: MarketCryptoGridListTile(
                              name: 'EOS',
                              val1: 43.84,
                              val2: 0.04,
                            ),
                            child1: MarketCryptoGridListTile(
                              name: 'MRK',
                              val1: 233.14,
                              val2: -1.27,
                            ),
                          ),
                          CustomGridView(
                            child2: MarketCryptoGridListTile(
                              name: 'XRP',
                              val1: 43.84,
                              val2: 0.04,
                            ),
                            child1: MarketCryptoGridListTile(
                              name: 'BNB',
                              val1: 233.14,
                              val2: -3.27,
                            ),
                          ),
                          CustomGridView(
                            child1: MarketCryptoGridListTile(
                              name: 'NEO',
                              val1: 43.84,
                              val2: 0.04,
                            ),
                            child2: Text(''),
                          ),
                        ],
                      )
                    : ListView(
                        children: [
                          MarketCryptoListTile(
                            name: 'BTC',
                            val1: 9293.74,
                            val2: 0.24,
                          ),
                          MarketCryptoListTile(
                            name: 'ETH',
                            val1: 233.14,
                            val2: -1.27,
                          ),
                          MarketCryptoListTile(
                            name: 'LTC',
                            val1: 43.84,
                            val2: 0.04,
                          ),
                          MarketCryptoListTile(
                            name: 'DASH',
                            val1: 233.14,
                            val2: -3.27,
                          ),
                          MarketCryptoListTile(
                            name: 'EOS',
                            val1: 43.84,
                            val2: 0.04,
                          ),
                          MarketCryptoListTile(
                            name: 'MRK',
                            val1: 233.14,
                            val2: -1.27,
                          ),
                          MarketCryptoListTile(
                            name: 'XRP',
                            val1: 43.84,
                            val2: 0.04,
                          ),
                          MarketCryptoListTile(
                            name: 'BNB',
                            val1: 233.14,
                            val2: -3.27,
                          ),
                          MarketCryptoListTile(
                            name: 'NEO',
                            val1: 43.84,
                            val2: 0.04,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  final Widget child1, child2;

  const CustomGridView({Key key, @required this.child1, @required this.child2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: child1,
        ),
        Expanded(
          child: child2,
        )
      ],
    );
  }
}

/// Grid Tile
class MarketCryptoGridListTile extends StatelessWidget {
  static const _data = [
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0
  ];

  final String name;
  final double val1, val2;
  const MarketCryptoGridListTile({
    Key key,
    this.name,
    this.val1,
    this.val2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNegative = val2 < 0;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, HomeDetails.route),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomContainer(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.star,
                        color: const Color(0xff3A3C40),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 30,
                          child: Dash(
                            length: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Sparkline(
                            data: _data,
                            lineColor: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text.rich(
                    TextSpan(
                      text: '$val1\n',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${isNegative ? '-' : '+'}$val2%',
                          style: TextStyle(
                            fontSize: 10,
                            color: isNegative
                                ? const Color(0xffFF1744)
                                : const Color(0xff00E676),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// List Tile
class MarketCryptoListTile extends StatelessWidget {
  static const _data = [
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0
  ];

  final String name;
  final double val1, val2;
  const MarketCryptoListTile({
    Key key,
    this.name,
    this.val1,
    this.val2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNegative = val2 < 0;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, HomeDetails.route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CustomContainer(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: const Color(0xff3A3C40),
              ),
              SizedBox(width: 5),
              CircleAvatar(
                radius: 15,
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Dash(
                        length: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Sparkline(
                        data: _data,
                        lineColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              Text.rich(
                TextSpan(
                  text: '₮val1\n',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '${isNegative ? '-' : '+'}$val2%',
                      style: TextStyle(
                        fontSize: 10,
                        color: isNegative
                            ? const Color(0xffFF1744)
                            : const Color(0xff00E676),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
