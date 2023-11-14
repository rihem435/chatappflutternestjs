import 'package:app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContactCard extends StatelessWidget {
  final ChatModel? contact;
  const CustomContactCard({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                child: Icon(Icons.check, color: Colors.white, size: 18),
                radius: 11,
                backgroundColor: Colors.teal,
              ),
            )
          ],
        ),
      ),
      title: Text(
        contact!.name!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        contact!.status!,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
