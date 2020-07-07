import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Wallet extends StatelessWidget {
  static const route = 'Wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Wallets'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kAllPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '₮',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '12,041.20',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xff1c1c1c),
                    ),
                    child: DropdownButton<String>(
                      value: 'This month',
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        wordSpacing: 0.5,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String newValue) {},
                      items: <String>['This month']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: const Color(0xff00E676),
                  ),
                  Text(
                    '9.24%',
                    style: TextStyle(
                      color: const Color(0xff00E676),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      fontSize: 12,
                    ),
                  )
                ],
              ),

              /// Graph
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Sparkline(
                        lineColor: Colors.red,
                        data: [
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
                        ],
                        fillMode: FillMode.below,
                        fillColor: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Sparkline(
                        lineColor: Colors.green,
                        data: [
                          0.0,
                          1.0,
                          1.5,
                          0.0,
                          -0.5,
                          -1.0,
                          -0.5,
                          0.0,
                          2.0,
                          0.0,
                          0.0
                        ],
                        fillMode: FillMode.below,
                        fillColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// Wallets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.red,
                height: 160,
              ),

              SizedBox(height: 20),

              /// Recent transaction
              Text(
                'Recent transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              RecentTransactionListTile(),
              RecentTransactionListTile(
                title: 'Trader Aseli',
                subtitle: 'Sent - 1 Jan 2020',
                trailing: '-0.112 ETH',
                isNegative: true,
              ),
              RecentTransactionListTile(
                title: 'Lite coin Indonesia',
                trailing: '+1.33 LTC',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentTransactionListTile extends StatelessWidget {
  final String title, subtitle, trailing;
  final bool isNegative;

  const RecentTransactionListTile(
      {Key key,
      this.title = 'Lapak laku',
      this.subtitle = 'Received - 1 Jan 2020',
      this.trailing = '+1.33 BTC',
      this.isNegative = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 35.5,
        height: 35.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffffffff),
        ),
        child: Icon(
          isNegative ? Icons.arrow_downward : Icons.arrow_upward,
          color: isNegative ? const Color(0xffFC6664) : const Color(0xff3DD65D),
        ),
      ),
      title: Text(
        'Lapak laku',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          letterSpacing: 0.5,
          color: const Color(0xff9DA5B7),
        ),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
