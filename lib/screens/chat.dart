import 'package:flutter/material.dart';
import 'package:ecoin/constants.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kAllPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading and language Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat',
                    style: kHeadingTextStyle,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.5),
                      color: const Color(0xff181818),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffffc400)),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: const Color(0xffFFC400),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: const Color(0xffFFC400),
                        wordSpacing: 0.5,
                        fontSize: 12,
                      ),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'English',
                        'Hindi',
                        'French',
                        'Japanese',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// Chat
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xff1c1c1c),
                  ),
                  child: ListView(
                    children: [
                      ChatTile(
                        userName: 'Cristian24',
                        messageText:
                            'Hi, had anyone had an order go thru on goxyet?',
                      ),
                      ChatTile(
                        userName: 'koolio',
                        messageText: 'arise my roasted chikun snack',
                      ),
                      ChatTile(
                        userName: 'Gambit',
                        messageText:
                            'I speak the absolute truth, hop on ITC til gox is fully functional.',
                      ),
                      ChatTile(
                        isAdmin: true,
                        userName: 'Admin',
                        messageText:
                            '@Cristian24, You should be able to do it, are you having an issue when attempting your withdrawal?',
                      ),
                      ChatTile(
                        userName: 'Cristian24',
                        messageText:
                            'Hi, had anyone had an order go thru on goxyet?',
                      ),
                      ChatTile(
                        userName: 'koolio',
                        messageText: 'arise my roasted chikun snack',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xff1c1c1c),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChatDetailsTile(
                          optionText: 'Users',
                          value: '20',
                        ),
                        ChatDetailsTile(
                          optionText: 'Guests',
                          value: '8',
                        ),
                        ChatDetailsTile(
                          optionText: 'Bots',
                          value: '6',
                        ),
                      ],
                    ),
                    ChatDetailsTile(
                      isAdmin: true,
                      optionText: 'Admin',
                      value: 'Online',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String messageText, userName;
  final bool isAdmin;

  const ChatTile(
      {Key key,
      @required this.messageText,
      @required this.userName,
      this.isAdmin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$userName :  ',
            style: TextStyle(
              color:
                  isAdmin ? const Color(0xffFF1744) : const Color(0xff00E676),
              wordSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          Expanded(
            child: Text(
              messageText,
              style: TextStyle(
                color: Colors.white,
                wordSpacing: 0.5,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatDetailsTile extends StatelessWidget {
  final String value, optionText;
  final bool isAdmin;

  const ChatDetailsTile(
      {Key key,
      @required this.value,
      @required this.optionText,
      this.isAdmin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$optionText :  ',
            style: TextStyle(
              color:
                  isAdmin ? const Color(0xffFF1744) : const Color(0xff00E676),
              wordSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isAdmin ? const Color(0xff00E676) : Colors.white,
              fontWeight: FontWeight.w500,
              wordSpacing: 0.5,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
