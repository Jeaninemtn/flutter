import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _autoLoginAllowed = false;

  bool _notificationUsage = false;
  bool _notificationAction = false;
  bool _notificationEvent = false;
  bool _notificationLinkStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings",
              style: TextStyle(fontWeight: FontWeight.bold)),
          // centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _autoLoginAllowed,
                title: const Text("Auto login when APP starts"),
                onChanged: (bool? value) {
                  setState(() {
                    _autoLoginAllowed = value!;
                  });
                },
              ),
              const Text("Notification"),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationUsage,
                title: const Text("Usage"),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationUsage = value!;
                  });
                },
              ),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationAction,
                title: const Text("Remote Control"),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationAction = value!;
                  });
                },
              ),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationEvent,
                title: const Text("Event"),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationEvent = value!;
                  });
                },
              ),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationLinkStatus,
                title: const Text("Link Status"),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationLinkStatus = value!;
                  });
                },
              ),
            ],
          ),
        ));
  }
}

// SwitchListTile
// https://api.flutter.dev/flutter/material/SwitchListTile-class.html