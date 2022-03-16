import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/bar_chart2.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'rooms.dart';
import '../components/room_card.dart';

/// Displays a list of SampleItems.
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class SampleItemListView extends StatelessWidget {
  SampleItemListView(
      {Key? key,
      this.items = const [SampleItem(1, "Lamba", "/lamb"), SampleItem(2, "Derece", "/degree")],
      this.rooms = const [
        Rooms(1, "Kitchen", Icons.kitchen, Color.fromRGBO(5, 222, 95, 1)),
        Rooms(2, "Living Room", Icons.living, Color.fromRGBO(7, 148, 211, 1)),
        Rooms(3, "Bath Room", Icons.bathroom, Color.fromRGBO(186, 7, 206, 1)),
        Rooms(4, "Bed Room", Icons.bedroom_parent, Color.fromRGBO(227, 162, 5, 1)),
      ]})
      : super(key: key);

  static const routeName = '/';

  final List<Rooms> rooms;

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(''),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.format_align_left,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 1, child: atisPicture()),
              Expanded(flex: 3, child: BarChartSample2()),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rooms.length,
                  itemBuilder: (BuildContext context, int index) {
                    return roomCard(items: rooms[index]);
                  },
                ),
              ),
              // Expanded(flex: 1, child: Container())
            ],
          ),
        ));
  }

  Container atisPicture() {
    return Container(child: Image.asset("assets/images/atis_logo_bw.png"));
  }
}
