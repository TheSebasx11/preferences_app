import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String routerName = "Settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;
  int gender = 1;
  String name = "Pedro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), centerTitle: true),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Ajustes",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
            ),
            const Divider(),
            SwitchListTile.adaptive(
                value: Preferences.isDark,
                title: const Text("Darkmode"),
                onChanged: (value) {
                  Preferences.isDark = value;
                  final theme =
                      Provider.of<ThemeProvider>(context, listen: false);

                  value ? theme.setDarkMode() : theme.setLightMode();
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
              value: 1,
              groupValue: Preferences.gender,
              title: const Text("Masculino"),
              onChanged: (value) {
                Preferences.gender = value ?? 1;
                setState(() {});
              },
            ),
            const Divider(),
            RadioListTile<int>(
              value: 2,
              groupValue: Preferences.gender,
              title: const Text("Femenino"),
              onChanged: (value) {
                Preferences.gender = value ?? 2;
                setState(() {});
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                initialValue: "Sebastian",
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  helperText: "Nombre del usuario",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
