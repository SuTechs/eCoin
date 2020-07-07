import 'package:ecoin/widgets/bigGreenButton.dart';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:ecoin/widgets/dash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

const _data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Orders',
                  style: kHeadingTextStyle,
                ),
                SizedBox(height: 20),
                CustomContainer(
                  child: TabBar(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff505053)),
                    tabs: [
                      Tab(
                        icon: Text('Active'),
                      ),
                      Tab(
                        icon: Text('Pending'),
                      ),
                      Tab(
                        icon: Text('Closed'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ActiveOrderScreen(),
                      PendingOrderScreen(),
                      Center(
                        child: Text(
                          'Closed Order Screen',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Order Screen
class ActiveOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ActiveMarketListTile(),
          ActiveMarketListTile(),
        ],
      ),
    );
  }
}

class PendingOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PendingMarketListTile(),
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Increase the amount'),
      ),
      body: Padding(
        padding: kAllPagePadding,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomContainer(
                      padding: EdgeInsets.all(10),
                      child: CryptoToUSDT(),
                    ),

                    SizedBox(height: 20),

                    /// amount
                    CustomContainer(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(),
                              title: Text(
                                'Amount',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '27,145.91 USDT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    /// auto increase trade
                    CustomContainer(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Auto increase this trade next time ',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.5,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Switch(
                            value: true,
                            onChanged: (v) {},
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xff00E676),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BigGreenButton(
              text: 'Increase',
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}

/// Order Screen components
class Button extends StatelessWidget {
  final double width, height;
  final Color color;
  final String text;

  const Button({
    Key key,
    this.width,
    this.height,
    this.color = const Color(0xff3A3C40),
    this.text = 'Button',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: color,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class CryptoToUSDT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          child: Stack(
            children: [
              CircleAvatar(),
              Positioned(
                left: 15,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'BTC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  child: Image.asset('assets/images/settingIcons/convert.png'),
                  backgroundColor: const Color(0x00000000),
                  radius: 15,
                  // backgroundColor: const Color(0x00000000),
                ),
                SizedBox(width: 8),
                Text(
                  'USDT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '0.3 BTC * 10',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Button(
                text: '+0.0213 BTC',
                color: const Color(0xff00E676),
              ),
              SizedBox(height: 10),
              Text(
                '0.3 BTC * 10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActiveMarketListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CryptoToUSDT(),
          SizedBox(height: 10),

          /// Graph
          Container(
            height: 50,
            child: Stack(
              children: [
                Center(
                  child: Dash(
                    length: MediaQuery.of(context).size.width,
                  ),
                ),
                Sparkline(
                  data: _data,
                  lineColor: Colors.green,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Button(
                    text: 'TP',
                  ),
                  SizedBox(width: 5),
                  Button(
                    text: 'SL',
                  ),
                  SizedBox(width: 5),
                  Button(
                    text: 'AL',
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OrderDetails())),
                    child: Button(
                      color: const Color(0xffFFC400),
                      text: 'Increase',
                    ),
                  ),
                  SizedBox(width: 5),
                  Button(
                    text: 'Close out',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PendingMarketListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          /// crypto to usdt pending
          Row(
            children: [
              /// Two crypto icon
              Container(
                width: 60,
                height: 60,
                child: Stack(
                  children: [
                    CircleAvatar(),
                    Positioned(
                      left: 15,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),

              /// crypto to usdt part
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'BTC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        child: Image.asset(
                            'assets/images/settingIcons/convert.png'),
                        backgroundColor: const Color(0x00000000),

                        radius: 15,
                        // backgroundColor: const Color(0x00000000),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'USDT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '0.3 BTC * 10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),

              ///
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '12,439.95',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Buy at 13,232.95',
                      style: TextStyle(
                        color: const Color(0xff3A3C40),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          /// Graph
          Container(
            height: 50,
            child: Stack(
              children: [
                Center(
                  child: Dash(
                    length: MediaQuery.of(context).size.width,
                  ),
                ),
                Sparkline(
                  data: _data,
                  lineColor: Colors.red,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Button(
                    text: 'TP',
                  ),
                  SizedBox(width: 5),
                  Button(
                    text: 'SL',
                  ),
                  SizedBox(width: 5),
                  Button(
                    text: 'AL',
                  ),
                ],
              ),
              Button(
                text: 'Cancel pending order',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
