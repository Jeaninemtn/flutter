import 'package:flutter/material.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPage();
}

class _DeviceInfoPage extends State<DeviceInfoPage> {
  
  final List<String> entries = <String>[
    'Device A',
    'Device B',
    'Device C',
    'Device D',
    'Device E',
    'Device F'
  ];

  /*
  static const List<DeviceInfo> deviceListData = <DeviceInfo>[
    DeviceInfo(0, 'Device A', Icons.device_hub, Colors.deepPurple),
    DeviceInfo(1, 'Device B', Icons.device_hub, Colors.deepPurple),
    DeviceInfo(2, 'Device C', Icons.device_hub, Colors.indigo),
    DeviceInfo(3, 'Device D', Icons.device_hub, Colors.deepPurple),
    DeviceInfo(4, 'Device E', Icons.device_hub, Colors.deepPurple),
  ];
  */

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                onTap: () {},
                title: Text(
                  entries[index], 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("192.168.202.25"),
                leading: const Icon(Icons.device_hub, size: 28.0),
                trailing: IconButton(
                  icon: const Icon(Icons.data_thresholding, size: 28.0),
                  onPressed: () {},
                )),
          );
        },
        itemCount: entries.length);
  }
}

// ListView
// https://blog.logrocket.com/creating-listviews-in-flutter/

// ListTile
// https://api.flutter.dev/flutter/material/ListTile-class.html

class DeviceInfo {
  // constructor
  const DeviceInfo(this.index, this.title, this.icon, this.color);
  // properties
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
