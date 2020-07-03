import 'package:ecoin/widgets/bigGreenButton.dart';
import 'package:ecoin/widgets/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';

class Deposit extends StatelessWidget {
  static const String route = 'Deposit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Deposit'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kAllPagePadding,
          child: Container(
            padding: EdgeInsets.only(top: 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '₮1,500',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0.5,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  '0.17 BTC',
                  style: TextStyle(
                      fontSize: 12, wordSpacing: 0.5, color: Colors.white),
                ),

                SizedBox(height: 30),

                /// Container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xff1c1c1c),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///From Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('From', style: kDepositTitleTextStyle),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  value: 'Jose Morgan ****4366',
                                  icon: Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  style: kDepositOptionTextStyle,
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String newValue) {},
                                  items: <String>[
                                    'Jose Morgan ****4366',
                                    'Su Mit ****5166'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          Dash(length: MediaQuery.of(context).size.width),
                        ],
                      ),
                      SizedBox(height: 15),

                      /// Card Number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Card number', style: kDepositTitleTextStyle),
                          SizedBox(height: 15),
                          Text('4567 9048 4399 4366',
                              style: kDepositOptionTextStyle),
                          SizedBox(height: 15),
                          Dash(length: MediaQuery.of(context).size.width),
                        ],
                      ),
                      SizedBox(height: 15),

                      /// Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name', style: kDepositTitleTextStyle),
                          SizedBox(height: 15),
                          Text('Jose Morgan', style: kDepositOptionTextStyle),
                          SizedBox(height: 15),
                          Dash(length: MediaQuery.of(context).size.width),
                        ],
                      ),
                      SizedBox(height: 15),

                      /// Card Details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expiration date',
                                    style: kDepositTitleTextStyle),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff505053),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: DropdownButton<String>(
                                        value: '07',
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                        style: TextStyle(
                                          wordSpacing: 0.5,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        underline: Container(
                                          height: 0,
                                        ),
                                        onChanged: (String newValue) {},
                                        items: <String>[
                                          '01',
                                          '02',
                                          '03',
                                          '04',
                                          '05',
                                          '06',
                                          '07',
                                          '08',
                                          '09',
                                          '10',
                                          '11',
                                          '12',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      height: 38,
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff505053),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: DropdownButton<String>(
                                        value: '22',
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                        style: TextStyle(
                                          wordSpacing: 0.5,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        underline: Container(
                                          height: 0,
                                        ),
                                        onChanged: (String newValue) {},
                                        items: <String>[
                                          '21',
                                          '22',
                                          '23',
                                          '24',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      height: 38,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('CVV', style: kDepositTitleTextStyle),
                                SizedBox(height: 10),
                                Text('796', style: kDepositOptionTextStyle),
                                SizedBox(height: 10),
                                Dash(
                                    length: MediaQuery.of(context).size.width *
                                        0.5),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 60),

                      /// To Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To', style: kDepositTitleTextStyle),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButton<String>(
                                    value: 'Bitcoin ****De66',
                                    icon: Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: kDepositOptionTextStyle,
                                    underline: Container(
                                      height: 0,
                                    ),
                                    onChanged: (String newValue) {},
                                    items: <String>[
                                      'Bitcoin ****De66',
                                      'Su Mit ****5166'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              value,
                                              style: kDepositOptionTextStyle,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Dash(length: MediaQuery.of(context).size.width),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                /// Fee
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FEE ₮2.50',
                    style: TextStyle(
                        fontSize: 13,
                        wordSpacing: 0.5,
                        color: const Color(0xff3A3C40)),
                  ),
                ),
                SizedBox(height: 5),

                /// Green Button
                BigGreenButton(text: 'Pay ₮1502.50', onTap: null),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
