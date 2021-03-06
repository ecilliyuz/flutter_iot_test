import 'package:flutter/material.dart';

import 'settings_controller.dart';
import 'package:settings_ui/settings_ui.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.all(16),
      //   // Glue the SettingsController to the theme selection DropdownButton.
      //   //
      //   // When a user selects a theme from the dropdown list, the
      //   // SettingsController is updated, which rebuilds the MaterialApp.
      //   child: DropdownButton<ThemeMode>(
      //     // Read the selected themeMode from the controller
      //     value: controller.themeMode,
      //     // Call the updateThemeMode method any time the user selects a theme.
      //     onChanged: controller.updateThemeMode,
      //     items: const [
      //       DropdownMenuItem(
      //         value: ThemeMode.system,
      //         child: Text('System Theme'),
      //       ),
      //       DropdownMenuItem(
      //         value: ThemeMode.light,
      //         child: Text('Light Theme'),
      //       ),
      //       DropdownMenuItem(
      //         value: ThemeMode.dark,
      //         child: Text('Dark Theme'),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
