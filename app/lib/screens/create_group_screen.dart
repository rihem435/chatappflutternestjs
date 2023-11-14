import 'package:app/customUI/custom_button_card.dart';
import 'package:app/customUI/custom_contact_card.dart';
import 'package:app/model/chat_model.dart';
import 'package:flutter/material.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Dev Stack1", status: "A full stack developer"),
      ChatModel(name: "Dev Stack2", status: "A full stack developer"),
      ChatModel(name: "Dev Stack3", status: "A full stack developer"),
      ChatModel(name: "Dev Stack4", status: "A full stack developer"),
    ];
    List<ChatModel> groups = [];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "New Group ",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add participants",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: ((context, index) {
          return InkWell(
            child: CustomContactCard(
              contact: contacts[index],
            ),
            onTap: () {
              if (contacts[index].select == false) {
                contacts[index].select == true;
                groups.add(contacts[index]);
              }
            },
          );
        }),
      ),
    );
  }
}
