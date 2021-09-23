import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/47724710?v=4',
                  ),
                ),
                Text(
                  'Lucas Fell',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 36.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Zallpy Trainee'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                    color: Colors.teal[100],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '+55 51 9 8011 1438',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal[900],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'lucas.fell@zallpy.com',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal[900],
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
