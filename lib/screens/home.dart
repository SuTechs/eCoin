import 'package:ecoin/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';

class Home extends StatelessWidget {
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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Login.route),
                  child: Text(
                    'Folio',
                    style: kHeadingTextStyle,
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
