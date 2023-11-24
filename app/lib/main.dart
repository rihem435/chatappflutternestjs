import 'package:app/screens/camera_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF075E54)),
        secondaryHeaderColor: Color(0xFF128C7E),
      ),
      home: HomeScreen(),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> items = ['Apple', 'Banana', 'Orange', 'Grapes', 'Watermelon'];
//   List<String> filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredItems.addAll(items);
//   }

//   void filterList(String query) {
//     filteredItems.clear();
//     items.forEach((item) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         filteredItems.add(item);
//       }
//     });
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Example'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (query) {
//                 filterList(query);
//               },
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 hintText: 'Enter a search term',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
