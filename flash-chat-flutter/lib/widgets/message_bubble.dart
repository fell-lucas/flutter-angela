import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.text,
    @required this.sender,
    @required this.sentByLoggedUser,
  }) : super(key: key);

  final String text;
  final String sender;
  final bool sentByLoggedUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: sentByLoggedUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 3.0),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              topLeft:
                  sentByLoggedUser ? Radius.circular(15.0) : Radius.circular(0),
              topRight:
                  sentByLoggedUser ? Radius.circular(0) : Radius.circular(15.0),
            ),
            elevation: 5.0,
            color: sentByLoggedUser ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: sentByLoggedUser ? Colors.white : Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
