import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Orders',
                  style: kHeadingTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
