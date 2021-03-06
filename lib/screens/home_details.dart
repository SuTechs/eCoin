import 'package:ecoin/screens/login.dart';
import 'package:ecoin/widgets/candlechart.dart';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:ecoin/widgets/dash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import '../constants.dart';

class HomeDetails extends StatelessWidget {
  static const route = 'HomeDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text.rich(
                TextSpan(
                  text: 'BTC <> USDT\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 0.0055,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '₮9293.74',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CircleAvatar(),
          ],
        ),
      ),
      body: Padding(
        padding: kAllPagePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Graph
              CandleChart(),

              SizedBox(height: 20),

              /// 24 hour Change
              CustomContainer(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '24hr Change',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '24hr High',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '24hr Low',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '00E676',
                            style: TextStyle(
                                color: const Color(0xff00E676),
                                fontSize: 14,
                                letterSpacing: 0.075,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '₮9230.35',
                            style: TextStyle(
                                color: const Color(0xff00E676),
                                fontSize: 14,
                                letterSpacing: 0.075,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '₮9101',
                            style: TextStyle(
                                color: const Color(0xffFF1744),
                                fontSize: 14,
                                letterSpacing: 0.075,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Dash(
                      length: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Rate',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Fee',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Contract Rate',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Contract Rate and Quantity
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Contract Rate', style: kDepositTitleTextStyle),
                  SizedBox(height: 8),
                  CustomContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text('0.30 BTC', style: kDepositOptionTextStyle)),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Contract Quantity', style: kDepositTitleTextStyle),
                  SizedBox(height: 8),
                  CustomContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child:
                          Text('3049.00 USDT', style: kDepositOptionTextStyle)),
                ],
              ),

              SizedBox(height: 20),

              /// Buy Sell Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Login.route),
                    child: Container(
                      height: 48,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff3DD65D),
                      ),
                      child: Center(
                        child: Text(
                          'Buy/Up',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Login.route),
                    child: Container(
                      height: 48,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffFF1744),
                      ),
                      child: Center(
                        child: Text(
                          'Sell/Down',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// OrderBook
              Text(
                'Order Book',
                style: TextStyle(
                  color: const Color(0xffDADADA),
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.left,
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
              CustomContainer(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total (Lot)',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Price (USDT)',
                            style: TextStyle(
                              color: const Color(0xffDADADA),
                              fontSize: 11,
                              letterSpacing: 0.075,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownButton<String>(
                              value: 'Total (Lot)',
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: const Color(0xffDADADA),
                              ),
                              style: TextStyle(
                                color: const Color(0xffDADADA),
                                fontSize: 11,
                                letterSpacing: 0.075,
                              ),
                              underline: Container(
                                height: 0,
                              ),
                              onChanged: (String newValue) {},
                              items: <String>[
                                'Total (Lot)'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Dash(
                      length: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 10),
                    for (int i = 0; i < 10; i++) OrderBookDetailsValue(),
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

class OrderBookDetailsValue extends StatelessWidget {
  final String val1, val2, val3, val4;

  const OrderBookDetailsValue({
    Key key,
    this.val1 = '221,765',
    this.val2 = '9282',
    this.val3 = '9283',
    this.val4 = '54,073',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              val1,
              style: TextStyle(
                color: const Color(0xffDADADA),
                fontSize: 10,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              val2,
              style: TextStyle(
                color: const Color(0xff00E676),
                fontSize: 10,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              val3,
              style: TextStyle(
                color: const Color(0xffFF1744),
                fontSize: 10,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              val4,
              style: TextStyle(
                color: const Color(0xffDADADA),
                fontSize: 10,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
