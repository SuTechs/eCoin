import 'package:ecoin/screens/home_details.dart';
import 'package:ecoin/widgets/candlechart.dart';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:ecoin/widgets/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Folio',
                      style: kHeadingTextStyle,
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    )
                  ],
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
                CandleChart(),

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
