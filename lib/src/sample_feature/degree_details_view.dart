import 'package:flutter/material.dart';

/// Displays detailed information about a Degree.
class DegreeDetailsView extends StatelessWidget {
  const DegreeDetailsView({Key? key}) : super(key: key);

  static const routeName = '/degree';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Degree Settings'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
