import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/sample_feature/rooms_details.view.dart';

/// A placeholder class that represents an entity or model.
class Rooms {
  const Rooms(this.id, this.title, this.icon, this.color);

  final int id;
  final String title;
  final IconData icon;
  final Color color;
}
