import 'dart:convert';
import 'package:ecoin/widgets/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:k_chart/flutter_k_chart.dart';
import 'package:k_chart/k_chart_widget.dart';
import 'package:http/http.dart' as http;

class CandleChart extends StatefulWidget {
  @override
  _CandleChartState createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  static const List<String> buttonsText = ['1m', '5m', '15m', '30m', '1h'];
  List<Color> buttonsColors = List(buttonsText.length);
  List<KLineEntity> datas;
  bool showLoading = true;
  MainState _mainState = MainState.NONE;
  SecondaryState _secondaryState = SecondaryState.NONE;

  @override
  void initState() {
    super.initState();
    getData('1day');
    selectButton(0);
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      child: Column(
        children: <Widget>[
          /// Chart Changer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
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
                  SizedBox(width: 5),
                  DropdownButton<String>(
                    value: 'Timeline',
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
                    onChanged: (String newValue) {
                      /// This function can be extracted
                      for (int i = 0; i < buttonsColors.length; i++)
                        buttonsColors[i] = Colors.white;

                      switch (newValue) {
                        case '12h':
                          getData('1mon');
                          break;
                        case '1d':
                          getData('1min');
                          break;
                        case '1M':
                          getData('1mon');
                          break;
                        case '6M':
                          getData('1year');
                          break;
                        case '1Y':
                          getData('60min');
                          break;
                        default:
                          getData('1year');
                          break;
                      }

                      setState(() {});
                    },
                    items: <String>[
                      'Timeline',
                      '12h',
                      '1d',
                      '1w',
                      '1M',
                      '6M',
                      '1Y',
                      '6Y'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
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

          /// Graph
          Stack(children: <Widget>[
            Container(
              height: 350,
              child: KChartWidget(
                datas,
                isChinese: false,
                isLine: false,
                mainState: _mainState,
                secondaryState: _secondaryState,
                fixedLength: 2,
                timeFormat: TimeFormat.YEAR_MONTH_DAY,
              ),
            ),
            if (showLoading)
              Container(
                  width: double.infinity,
                  height: 350,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
          ]),
          SizedBox(height: 20),

          /// Chart Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < buttonsText.length; i++)
                button(
                    text: buttonsText[i],
                    color: buttonsColors[i],
                    onPressed: () {
                      setState(() {
                        selectButton(i);
                        print('Selected button is ${buttonsText[i]}');
                      });
                    })
            ],
          ),
        ],
      ),
    );
  }

  void selectButton(int selectedButton) {
    for (int i = 0; i < buttonsColors.length; i++)
      buttonsColors[i] = Colors.white;
    buttonsColors[selectedButton] = const Color(0xffFFC400);

    switch (selectedButton) {
      case 0:
        getData('1day');
        break;
      case 1:
        getData('1min');
        break;
      case 2:
        getData('1mon');
        break;
      case 3:
        getData('1year');
        break;
      case 4:
        getData('60min');
        break;
        break;
    }
  }

  /// Buttons
  Widget button({String text, VoidCallback onPressed, Color color}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 33.4,
        height: 32.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: color),
        child: Center(child: Text('$text')),
      ),
    );
  }

  void getData(String period) {
    Future<String> future = getIPAddress('$period');
    future.then((result) {
      Map parseJson = json.decode(result);
      List list = parseJson['data'];
      datas = list
          .map((item) => KLineEntity.fromJson(item))
          .toList()
          .reversed
          .toList()
          .cast<KLineEntity>();
      DataUtil.calculate(datas);
      showLoading = false;
      setState(() {});
    }).catchError((e) {
      showLoading = false;
      setState(() {});
      print('Hello Error = $e}');
    });
  }

  Future<String> getIPAddress(String period) async {
    var url =
        'https://api.huobi.br.com/market/history/kline?period=${period ?? '1day'}&size=300&symbol=btcusdt';
    String result;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      result = response.body;
    } else {
      print('Failed getting IP address');
    }
    return result;
  }
}
