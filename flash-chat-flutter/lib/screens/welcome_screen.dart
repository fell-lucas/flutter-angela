import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const route = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();
    colorAnimation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlue,
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
              text: 'Log in',
            ),
            RoundedButton(
              color: Colors.blueAccent,
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
