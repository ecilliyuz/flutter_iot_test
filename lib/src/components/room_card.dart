import 'package:flutter/material.dart';
import '../sample_feature/rooms.dart';
import '../sample_feature/rooms_details.view.dart';

class roomCard extends StatelessWidget {
  const roomCard({Key? key, required this.items}) : super(key: key);

  final Rooms items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
        Navigator.push(context, MaterialPageRoute(builder: (context) => RoomDetailsView(title: items.title)));
      },
      child: Container(
        width: 150,
        child: Card(
          color: items.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 35, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(items.icon, size: 40, color: Colors.white),
                  const SizedBox(
                    height: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items.title,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
