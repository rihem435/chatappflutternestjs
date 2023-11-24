import 'package:app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAvatarCard extends StatelessWidget {
  final ChatModel? contact;
  const CustomAvatarCard({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: SvgPicture.asset(
                  "assets/person.svg",
                  // ignore: deprecated_member_use
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 13,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contact!.name!,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
