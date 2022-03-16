import 'package:flutter/material.dart';

/// Displays detailed information about a Lamb.
class LambDetailsView extends StatelessWidget {
  const LambDetailsView({Key? key}) : super(key: key);

  static const routeName = '/lamb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lamb Settings'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
