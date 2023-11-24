import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewScreen extends StatelessWidget {
  const CameraViewScreen({Key? key, this.path}) : super(key: key);
  final String? path;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.title,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              size: 27,
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.sizeOf(context).height - 150,
            child: Image.file(File(path!)),
          ),
        ]),
      ),
    );
  }
}
