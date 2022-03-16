import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/toggle_switch.dart';

/// Displays detailed information about a Room.
class RoomDetailsView extends StatelessWidget {
  const RoomDetailsView({Key? key, required this.title}) : super(key: key);

  static const routeName = '/room';
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(title, style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Spacer(flex: 1),
                Expanded(flex: 1, child: BulbSwitch()),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                    flex: 2,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      // crossAxisSpacing: 10,
                      // mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: [roomFunctions(), roomFunctions(), roomFunctions()],
                    )),
                Spacer(flex: 1)
              ],
            ),
          ),
        ));
  }

  GestureDetector roomFunctions() {
    return GestureDetector(
      onTap: () {
        print("tapped");
      },
      child: Container(
        width: 150,
        child: Card(
          color: Colors.black54,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lightbulb, size: 40, color: Colors.white),
                  const SizedBox(
                    height: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bulb',
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
