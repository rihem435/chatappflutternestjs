import 'package:app/customUI/custom_button_card.dart';
import 'package:app/customUI/custom_contact_card.dart';
import 'package:app/model/chat_model.dart';
import 'package:app/screens/create_group_screen.dart';
import 'package:flutter/material.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({Key? key}) : super(key: key);

  @override
  _SelectContactScreenState createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Dev Stack1", status: "A full stack developer"),
      ChatModel(name: "Dev Stack2", status: "A full stack developer"),
      ChatModel(name: "Dev Stack3", status: "A full stack developer"),
      ChatModel(name: "Dev Stack4", status: "A full stack developer"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "select contact ",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "256contacts",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
          PopupMenuButton<String>(itemBuilder: (BuildContext build) {
            return [
              PopupMenuItem(
                child: Text('Invite a friend '),
                value: "Invite a Friend",
              ),
              PopupMenuItem(
                child: Text('Contacts'),
                value: "Contacts",
              ),
              PopupMenuItem(
                child: Text('Refresh'),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text('Help'),
                value: "Help",
              )
            ];
          })
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: ((context, index) {
          if (index == 0) {
            return InkWell(
              child: CustomButtonCard(
                iconData: Icons.group,
                name: "New group----",
              ),
              onTap: () {
                print('----------------tap------------------');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => CreateGroupScreen()));
              },
            );
          } else if (index == 1) {
            return CustomButtonCard(
              iconData: Icons.person,
              name: "New contact",
            );
          }

          return InkWell(
            child: CustomContactCard(
              contact: contacts[index - 2],
            ),
            onTap: () {
              print("99999999999999999999999999999");
            },
          );
        }),
      ),
    );
  }
}
