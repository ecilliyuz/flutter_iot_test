import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/toggle_switch.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RoomDetailsView extends StatefulWidget {
  RoomDetailsView({Key? key, required this.title, required this.appBarColor}) : super(key: key);
  State<RoomDetailsView> createState() => RoomDetailsViewState();

  // RoomDetailsViewState createState() => RoomDetailsViewState(appBarColor: null, title: '');
  final String title;
  final Color appBarColor;
}

/// Displays detailed information about a Room.
class RoomDetailsViewState extends State<RoomDetailsView> {
  static const routeName = '/room';
  String showSome = "Bulb";

  getData() async {
    var url = Uri.parse('http://93.190.220.31:3000/lamb');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print(jsonResponse['degree']);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void postData(checkLamb) async {
    var url = Uri.parse('http://93.190.220.31:3000/lamb');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, body: {'lamb': checkLamb});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  // var url = Uri.parse('http://93.190.220.31:3000/lamb');
  //   var response = await http.post(url, body: {'lamb': 'true'});

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Spacer(flex: 1),
                showSome == 'Bulb'
                    ? Container(height: 150, child: Flexible(flex: 1, child: BulbSwitch(postData: postData)))
                    : Container(height: 150, child: Flexible(flex: 1, child: slider)),
                Spacer(
                  flex: 2,
                ),
                Flexible(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [roomFunctions(Icons.lightbulb, 'Bulb'), roomFunctions(Icons.thermostat, 'Heat')])),
                Spacer(flex: 1)
              ],
            ),
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      title: Text(widget.title, style: TextStyle(color: Colors.black)),
      centerTitle: true,
      backgroundColor: widget.appBarColor,
      elevation: 0,
    );
  }

  roomFunctions(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showSome = title;
        });
        print(showSome);
        print("tapped");
      },
      child: Container(
        width: 150,
        height: 150,
        child: Card(
          color: title == showSome ? widget.appBarColor : Colors.black54,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: Colors.white),
                  const SizedBox(
                    height: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
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

Widget slider = SleekCircularSlider(
  appearance: CircularSliderAppearance(),
  initialValue: 25,
  onChange: (double value) {
    print(value);
  },
);

Widget slider1 = SleekCircularSlider(
  appearance: CircularSliderAppearance(
    customColors: CustomSliderColors(trackColor: Colors.limeAccent, progressBarColors: [Colors.lightGreen, Colors.amberAccent], shadowMaxOpacity: 20.0),
    infoProperties: InfoProperties(topLabelText: 'Running..'),
  ),
  initialValue: 60,
  onChange: (double value) {
    print(value);
  },
);

Widget slider2 = SleekCircularSlider(
  appearance: CircularSliderAppearance(
    spinnerMode: true,
    size: 50.0,
    customWidths: CustomSliderWidths(trackWidth: 10.0, shadowWidth: 5.0),
  ),
  initialValue: 90,
  onChange: (double value) {
    print(value);
  },
);
