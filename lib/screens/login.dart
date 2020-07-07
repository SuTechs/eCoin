import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecoin/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String route = 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginWithEmail = true;

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
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 32,
                  ),
                  onTap: () =>
                      Navigator.pop(context), // onCancel Button Presses
                ),
                SizedBox(height: 30),
                Text(
                  'Welcome back!',
                  style: kHeadingTextStyle,
                ),
                SizedBox(height: 40),

                /// Email Field or Phone Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isLoginWithEmail ? 'Email' : 'Phone',
                      style: kLoginWhiteTextStyle,
                    ),
                    GestureDetector(
                      child: Text(
                        isLoginWithEmail
                            ? 'Login with phone'
                            : 'Login with email',
                        style: kLoginYellowTextStyle,
                      ),
                      onTap: () {
                        setState(() {
                          isLoginWithEmail = !isLoginWithEmail;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5),
                isLoginWithEmail
                    ? EmailField(
                        onEmailChanged: (email) => print('Email = $email'),
                      )
                    : PhoneField(
                        onPhoneNumberChanged: (number) =>
                            print('Phone Number = $number'),
                      ),

                SizedBox(height: 30),

                /// Password Field
                PasswordField(
                  onPasswordChanged: (password) =>
                      print('Password = $password'),
                ),

                SizedBox(height: 60),

                /// Login Button
                Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        wordSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                /// Register
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => SignUp())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No account yet? ',
                        style: kLoginWhiteTextStyle,
                      ),
                      Text(
                        'Register',
                        style: kLoginYellowTextStyle,
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

class SignUp extends StatelessWidget {
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
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 32,
                  ),
                  onTap: () =>
                      Navigator.pop(context), // onCancel Button Presses
                ),
                SizedBox(height: 30),
                Text(
                  'Register Now!',
                  style: kHeadingTextStyle,
                ),
                SizedBox(height: 40),

                /// Full Name
                Text(
                  'Full Name',
                  style: kLoginWhiteTextStyle,
                ),
                SizedBox(height: 5),
                EmailField(
                  textInputType: TextInputType.text,
                  onEmailChanged: (name) => print('Email = $name'),
                ),
                SizedBox(height: 30),

                /// Username
                Text(
                  'Username',
                  style: kLoginWhiteTextStyle,
                ),
                SizedBox(height: 5),
                EmailField(
                  textInputType: TextInputType.text,
                  onEmailChanged: (username) => print('Email = $username'),
                ),
                SizedBox(height: 30),

                /// Email
                Text(
                  'Email',
                  style: kLoginWhiteTextStyle,
                ),
                SizedBox(height: 5),
                EmailField(
                  onEmailChanged: (email) => print('Email = $email'),
                ),
                SizedBox(height: 30),

                /// Phone Field
                Text(
                  'Phone',
                  style: kLoginWhiteTextStyle,
                ),
                SizedBox(height: 5),
                PhoneField(
                  onPhoneNumberChanged: (number) =>
                      print('Phone Number = $number'),
                ),
                SizedBox(height: 30),

                /// Password Field
                PasswordField(
                  isLogin: false,
                  onPasswordChanged: (password) =>
                      print('Password = $password'),
                ),

                SizedBox(height: 60),

                /// SignUp Button
                Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        wordSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                /// Login
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Login())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: kLoginWhiteTextStyle,
                      ),
                      Text(
                        'Login',
                        style: kLoginYellowTextStyle,
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

/// components

class EmailField extends StatelessWidget {
  final void Function(String) onEmailChanged;
  final TextInputType textInputType;

  const EmailField(
      {Key key,
      @required this.onEmailChanged,
      this.textInputType = TextInputType.emailAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 43.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color(0xff242424),
      ),
      child: TextField(
        onChanged: onEmailChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(border: InputBorder.none),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  final void Function(String) onPhoneNumberChanged;

  const PhoneField({Key key, @required this.onPhoneNumberChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String code = '+1';
    String number = '';

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 43.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xff242424),
          ),
          child: CountryCodePicker(
            onChanged: (countryCode) {
              code = countryCode.dialCode;
              onPhoneNumberChanged(code + number);
            },
            initialSelection: 'us',
            favorite: ['+91', 'us', 'FR'],
            builder: (value) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(value.flagUri,
                        package: 'country_code_picker'),
                    radius: 16,
                  ),
                  Text(
                    '  ${value.dialCode}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      wordSpacing: 0.5,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              );
            },
          ),
        ),

        SizedBox(
          width: 10,
        ),

        /// Phone Field
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 43.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xff242424),
            ),
            child: TextField(
              onChanged: (value) {
                number = value;
                onPhoneNumberChanged(code + number);
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  final void Function(String) onPasswordChanged;
  final bool isLogin;

  const PasswordField(
      {Key key, @required this.onPasswordChanged, this.isLogin = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: kLoginWhiteTextStyle,
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 43.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xff242424),
          ),
          child: TextField(
            onChanged: onPasswordChanged,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        Visibility(
          visible: isLogin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Password?',
                style: kLoginYellowTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
