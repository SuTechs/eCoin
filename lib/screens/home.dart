import 'package:ecoin/screens/home_details.dart';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:ecoin/widgets/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';

class Home extends StatelessWidget {
  final List sampleData = [
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kAllPagePadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Folio',
                  style: kHeadingTextStyle,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.0075,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '₮ 12,345.67 (',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: '+₮100.00',
                        style: TextStyle(
                          color: const Color(0xff00e676),
                        ),
                      ),
                      TextSpan(
                        text: ')  (',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: '-₮100.00',
                        style: TextStyle(
                          color: const Color(0xffff1744),
                        ),
                      ),
                      TextSpan(
                        text: ')',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),

                /// Graph
                CustomContainer(
                  padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  child: Column(
                    children: [
                      /// Chart Changer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton<String>(
                            value: 'Candle Chart',
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: const Color(0xffDADADA),
                            ),
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              letterSpacing: 0.075,
                              fontSize: 11,
                            ),
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (String newValue) {},
                            items: <String>['Candle Chart']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '₮9,272.8 ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 11,
                                color: Colors.white,
                                letterSpacing: 0.0055,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: ' +3.49%',
                                  style: TextStyle(
                                    color: const Color(0xff00e676),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                        //color: Colors.red,
                        height: 330,
                        child: OHLCVGraph(
                            data: sampleData,
                            enableGridLines: true,
                            volumeProp: 0,
                            gridLineAmount: 5,
                            gridLineColor: Colors.grey[300],
                            gridLineLabelColor: Colors.grey),
                      ),

                      SizedBox(height: 20),

                      /// Chart Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 33.4,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Center(child: Text('1D')),
                          ),
                          Container(
                            width: 33.4,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffFFC400),
                            ),
                            child: Center(
                                child: Text(
                              '5D',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            width: 33.4,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Center(child: Text('1M')),
                          ),
                          Container(
                            width: 33.4,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Center(child: Text('1Y')),
                          ),
                          Container(
                            width: 33.4,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Center(child: Text('5Y')),
                          ),
                          Container(
                            width: 33.4,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Center(child: Text('Max')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                /// Message
                CustomContainer(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          'FUNDS YOUR ACCOUNT',
                          style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 12,
                              letterSpacing: 0.075,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: const Color(0x00000000),
                          child: Image.asset('assets/images/fund.png'),
                        ),
                        trailing: CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xffFFC400),
                          child: Text(
                            '1',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.075,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          'Your bank account is ready! Fund your Robinhood account to begin trading.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            letterSpacing: 0.075,
                          ),
                        ),
                        dense: true,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ADD FUNDS',
                        style: TextStyle(
                          color: const Color(0xff00E676),
                          fontSize: 12,
                          letterSpacing: 0.075,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                CryptoListTile(
                  name: 'BTC',
                  val1: 9293.74,
                  val2: 0.24,
                ),
                SizedBox(height: 10),
                CryptoListTile(
                  name: 'ETH',
                  val1: 233.14,
                  val2: -1.27,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CryptoListTile extends StatelessWidget {
  final String name;
  final double val1, val2;
  const CryptoListTile({
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
      child: CustomContainer(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(),
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
            Expanded(
              child: Center(
                child: Dash(
                  length: 100,
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                text: '₮$val1\n',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
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
    );
  }
}
