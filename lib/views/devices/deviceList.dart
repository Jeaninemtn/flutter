import 'package:flutter/material.dart';
import 'package:flutter_app/views/devices.dart';


class DeviceList extends StatelessWidget {
  // const DeviceList({super.key, MenuList? selectedView});
  final MenuList? selectedView;
  const DeviceList({super.key, this.selectedView});

  static const List<DeviceInfo> deviceListData = <DeviceInfo>[
    DeviceInfo(1, "192.1682.202.25", "Device A", "Normal", "Fab-A-1010"),
    DeviceInfo(2, "192.1682.202.27", "Device B", "Alert", "Fab-A-125"),
    DeviceInfo(3, "192.1682.212.12", "Device C", "Alert", "Fab-B-101"),
    DeviceInfo(4, "192.1682.223.13", "Device D", "Normal", "Fab-D-100"),
    DeviceInfo(5, "192.1682.225.14", "Device E", "Critical", "Fab-C-1010"),
    DeviceInfo(6, "192.1682.101.15", "Device F", "Alert", "Fab-Q-125"),
    DeviceInfo(7, "192.1682.119.20", "Device G", "Normal", "Fab-H-179"),
  ];

  @override
  Widget build(BuildContext context) {
    // return buildListView();
    if (selectedView == MenuList.gridView) {
      return buildGridView();
    } else if (selectedView == MenuList.listView) {
      return buildListView();
    } else if (selectedView == MenuList.detailView) {
      return buildDetailView();
    } else {
      return buildGridView();
    }
  }

  Widget buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: deviceListData.length,
        itemBuilder: (BuildContext context, int index) {
          final device = deviceListData[index];
          return Card(
            child: ListTile(
                onTap: () {},
                title: Text(
                  device.ip,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(device.systemName),
                leading: const Icon(Icons.device_hub, size: 28.0),
                trailing: IconButton(
                  icon: const Icon(Icons.data_thresholding, size: 28.0),
                  onPressed: () {},
                )),
          );
        });
  }

  Widget buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: deviceListData.length,
        itemBuilder: (BuildContext context, int index) {
          final device = deviceListData[index];
          return Card(
            color: Colors.deepPurple[100],
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.device_hub,
                size: 56,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                device.ip,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                device.systemName,
                style: const TextStyle(fontSize: 16),
              )
            ]),
          );
        });
  }

  Widget buildDetailView() {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: deviceListData.length,
        itemBuilder: (BuildContext context, int index) {
          final device = deviceListData[index];
          return ListTile(
            onTap: () {},
            title: Text(
              device.ip,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(device.systemName),
                  Text(device.systemLocation),
                  Text(device.status, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            leading: const Icon(Icons.device_hub, size: 28.0),              trailing: IconButton(
              icon: const Icon(Icons.data_thresholding, size: 28.0),
              onPressed: () {},
            )
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        );
  }
}

// ListView
// https://blog.logrocket.com/creating-listviews-in-flutter/

// ListTile
// https://api.flutter.dev/flutter/material/ListTile-class.html

// Multiple lines of subtitle in ListTile
// https://stackoverflow.com/questions/69390432/can-a-listtile-be-customized-to-accommodate-title-subtitle-and-another-text-li

class DeviceInfo {
  // constructor
  const DeviceInfo(this.id, this.ip, this.systemName, this.status, this.systemLocation);
  // properties
  final int id;
  final String ip;
  final String systemName;
  final String status;
  final String systemLocation;
}

// Full Screen Dialog
// https://api.flutter.dev/flutter/material/Dialog/Dialog.fullscreen.html
