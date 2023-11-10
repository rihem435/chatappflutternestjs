import 'package:app/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp Clone'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print('value : $value');
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('New group'),
                value: 'New group',
              ),
              PopupMenuItem(
                child: Text('New broakast'),
                value: 'New broakast',
              ),
              PopupMenuItem(
                child: Text('whatsapp web'),
                value: 'whatsapp Web',
              ),
              PopupMenuItem(
                child: Text('Started messages'),
                value: 'Started messages',
              ),
              PopupMenuItem(
                child: Text("Seettings"),
                value: "Settings",
              )
            ];
          })
        ],
        bottom: TabBar(
          controller: controller,
          //The color of the line that appears below the selected tab. 
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
          controller: controller,
          children: [Text('chat'), ChatPage(), Text('calls'), Text('status')]),
    );
  }
}
