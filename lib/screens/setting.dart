import 'package:ecoin/screens/settingDetails/deposit.dart';
import 'package:ecoin/screens/settingDetails/send.dart';
import 'package:ecoin/screens/settingDetails/wallet.dart';
import 'package:ecoin/screens/settingDetails/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';
import 'package:ecoin/widgets/dash.dart';

class Setting extends StatelessWidget {
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
                  'Settings',
                  style: kHeadingTextStyle,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xff1c1c1c),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Jose Morgan',
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Account ID : 49103041 ',
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OptionTile(
                                onTap: () =>
                                    Navigator.pushNamed(context, Deposit.route),
                                title: 'Deposit',
                                icon: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                              ),
                              OptionTile(
                                onTap: () => Navigator.pushNamed(
                                    context, Withdraw.route),
                                title: 'Withdraw',
                                icon: Icon(
                                  Icons.money_off,
                                  color: Colors.white,
                                ),
                              ),
                              OptionTile(
                                onTap: () =>
                                    Navigator.pushNamed(context, Send.route),
                                title: 'Send',
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.mode_edit,
                            color: const Color(0xffDADADA),
                          ),
                          onPressed: null,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),

                /// General
                Text(
                  'General',
                  style: TextStyle(
                    color: const Color(0xffDADADA),
                    fontSize: 13,
                    wordSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xff1c1c1c),
                  ),
                  child: Column(
                    children: [
                      /// My Wallet
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Wallet',
                              style: TextStyle(
                                color: Colors.white,
                                wordSpacing: 0.5,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTap: () => Navigator.pushNamed(context, Wallet.route),
                      ),
                      SizedBox(height: 15),
                      Dash(
                        length: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 15),

                      /// Card Manager
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Card Manager',
                            style: TextStyle(
                              color: Colors.white,
                              wordSpacing: 0.5,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Dash(
                        length: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 15),

                      /// Verification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Verification',
                            style: TextStyle(
                              color: Colors.white,
                              wordSpacing: 0.5,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                /// Settings
                Text(
                  'Settings',
                  style: TextStyle(
                    color: const Color(0xffDADADA),
                    fontSize: 13,
                    wordSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xff1c1c1c),
                  ),
                  child: Column(
                    children: [
                      /// Language
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                              color: Colors.white,
                              wordSpacing: 0.5,
                              fontSize: 16,
                            ),
                          ),

                          /// English Selected
                          Row(
                            children: [
                              Text(
                                'English',
                                style: TextStyle(
                                    color: Colors.white,
                                    wordSpacing: 0.5,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Dash(
                        length: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 15),

                      /// Two Factor Authentication
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Two factor authentication',
                            style: TextStyle(
                              color: Colors.white,
                              wordSpacing: 0.5,
                              fontSize: 16,
                            ),
                          ),
                          Switch(
                            value: true,
                            onChanged: (v) {},
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xff00E676),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Dash(
                        length: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 15),

                      /// User Interface (White/Dark)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User Interface (White/Dark)',
                            style: TextStyle(
                              color: Colors.white,
                              wordSpacing: 0.5,
                              fontSize: 16,
                            ),
                          ),
                          Switch(
                            value: true,
                            onChanged: (v) {},
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xff00E676),
                          ),
                        ],
                      ),
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

class OptionTile extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Widget icon;

  const OptionTile({
    Key key,
    @required this.onTap,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 59.0,
            height: 32.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xff505053),
            ),
            child: Center(
              child: icon,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title ?? '',
            style: TextStyle(
              color: const Color(0xffDADADA),
              wordSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          )
        ],
      ),
    );
  }
}
