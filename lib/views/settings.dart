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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _autoLoginAllowed,
                title: const Text(
                  "Auto Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Auto login when APP starts."),
                onChanged: (bool? value) {
                  setState(() {
                    _autoLoginAllowed = value!;
                  });
                },
              ),
              const Divider(height: 10,),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationUsage,
                title: const Text(
                  "Notification: Usage",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Receive notifications when device usages become crritical."
                ),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationUsage = value!;
                  });
                },
              ),
              const Divider(height: 10,),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationAction,
                title: const Text(
                  "Notification: Remote Control",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                 subtitle: const Text(
                  "Receive notifications when remote control actions end."
                ),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationAction = value!;
                  });
                },
              ),
              const Divider(height: 10,),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationEvent,
                title: const Text(
                  "Notification: Event",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Receive notifications when events happen."
                ),
                onChanged: (bool? value) {
                  setState(() {
                    _notificationEvent = value!;
                  });
                },
              ),
              const Divider(height: 10,),
              SwitchListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _notificationLinkStatus,
                title: const Text(
                  "Notification: Link Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Receive notifications when linkup or linkdown happens."
                ),
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