import 'package:app/customUI/custom_card.dart';
import 'package:app/model/chat_model.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Dev Stack",
        isGroup: false,
        currentMessage: "Hi everyone",
        time: "10:05",
        icon: "person.svg"),
    ChatModel(
        name: "Dev2 Stack",
        isGroup: true,
        currentMessage: "Hi everyone in this group",
        time: "10:05",
        icon: "group.svg"),
    ChatModel(
        name: "Dev2 Stack",
        isGroup: false,
        currentMessage: "Hi everyone",
        time: "10:05",
        icon: "person.svg"),
    ChatModel(
        name: "Dev2 Stack",
        isGroup: true,
        currentMessage: "Hi everyone",
        time: "10:05",
        icon: "group.svg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }
}
