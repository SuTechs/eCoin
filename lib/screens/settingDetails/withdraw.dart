import 'package:ecoin/widgets/bigGreenButton.dart';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Withdraw extends StatelessWidget {
  static const String route = 'Withdraw';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Withdraw'),
      ),
      body: Padding(
        padding: kAllPagePadding,
        child: Container(
          padding: EdgeInsets.only(top: 5),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Wallet for withdraw
                      Text(
                        'Wallet for withdraw',
                        style: kDepositTitleTextStyle,
                      ),
                      SizedBox(height: 5),
                      CustomContainer(
                        child: ListTile(
                          leading: CircleAvatar(),
                          title: Text(
                            '2.305 BTC',
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'Bitcoin',
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      /// Address
                      Text(
                        'Address',
                        style: kDepositTitleTextStyle,
                      ),
                      SizedBox(height: 5),
                      CustomContainer(
                        child: ListTile(
                          title: Text(
                            '58xfiwpeiw857xFcigfu3i2',
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      /// Amount to withdraw
                      Text(
                        'Amount to withdraw',
                        style: kDepositTitleTextStyle,
                      ),
                      SizedBox(height: 5),
                      CustomContainer(
                        child: ListTile(
                          title: Text(
                            '0.24125 BTC',
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              BigGreenButton(text: 'withdraw', onTap: null),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
