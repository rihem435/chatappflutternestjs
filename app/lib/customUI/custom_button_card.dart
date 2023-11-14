import 'package:app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonCard extends StatelessWidget {
  final String? name;
  final IconData? iconData;
  const CustomButtonCard({Key? key, this.name, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child:Icon(iconData, color: Colors.white,),
        backgroundColor:Color(0xFF128C7E),
      ),
      title: Text(
        name!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      
    );
  }
}
