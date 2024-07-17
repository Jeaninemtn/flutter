import 'package:flutter/material.dart';

import './devices/deviceList.dart';

enum MenuList { gridView, listView, detailView }

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {

  MenuList? selectedView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Devices"),
          // leading: const Icon(Icons.menu),
          actions: <Widget>[
            PopupMenuButton<MenuList>(
              initialValue: selectedView,
              onSelected: (MenuList item) {
                setState(() {
                  selectedView = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuList>>[
                const PopupMenuItem<MenuList>(
                  value: MenuList.gridView,
                  child: Text('Grid'),
                ),
                const PopupMenuItem<MenuList>(
                  value: MenuList.listView,
                  child: Text('List'),
                ),
                const PopupMenuItem<MenuList>(
                  value: MenuList.detailView,
                  child: Text('Detail'),
                ),
              ],
            )
          ],
          backgroundColor: Colors.deepPurple[300],
        ),
        body: const DeviceList(),
    );
  }
}
