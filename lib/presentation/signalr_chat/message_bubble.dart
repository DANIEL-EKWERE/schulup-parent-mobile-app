import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMine;

  ChatMessage({
    required this.text,
    required this.isMine,
  });
}

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      alignment: message.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: message.isMine ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft:
                message.isMine ? Radius.circular(12) : Radius.circular(0),
            bottomRight:
                message.isMine ? Radius.circular(0) : Radius.circular(12),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isMine ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
