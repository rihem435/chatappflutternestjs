import 'package:app/customUI/custom_avatar_card.dart';
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
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack1", status: "A full stack developer"),
    ChatModel(name: "Dev Stack2", status: "A full stack developer"),
    ChatModel(name: "Dev Stack3", status: "A full stack developer"),
    ChatModel(name: "Dev Stack4", status: "A full stack developer"),
    ChatModel(name: "Dev Stack1", status: "A full stack developer"),
    ChatModel(name: "Dev Stack2", status: "A full stack developer"),
    ChatModel(name: "Dev Stack3", status: "A full stack developer"),
    ChatModel(name: "Dev Stack4", status: "A full stack developer"),
  ];
  List<ChatModel> groups = [];
  List<ChatModel> groupMember = [];
  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length,
              itemBuilder: ((context, index) {
                print('index=====>$index');
                if (index == 0) {
                  print('-----------test if----------------------');
                  return Container(
                    height: groupMember.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  child: CustomContactCard(
                    contact: contacts[index],
                  ),
                  onTap: () {
                    print('---------------onTap create group------------');
                    if (contacts[index].select == true) {
                      setState(() {
                        groupMember.remove(contacts[index]);
                        contacts[index].select = false;

                        print('selet =====>${contacts[index].select}');
                      });
                    } else {
                      setState(() {
                        groupMember.add(contacts[index]);
                        contacts[index].select = true;
                        print('select else=====>${contacts[index].select}');
                      });
                    }
                  },
                );
              }),
            ),
            groupMember.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            if (contacts[index].select) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    print(
                                        'select else=====>${contacts[index].select}');
                                    groupMember.remove(contacts[index]);
                                    contacts[index].select = false;
                                  });
                                },
                                child: CustomAvatarCard(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          itemCount: contacts.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  )
                : Container()
          ],
        ));
  }
}
