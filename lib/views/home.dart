import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  // 定義底下Nav選單
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Devices', Icons.device_hub, Colors.deepPurple),
    Destination(1, 'Settings', Icons.settings, Colors.deepPurple),
    Destination(2, 'Home', Icons.home, Colors.indigo),
    Destination(3, 'Notification', Icons.notifications_on, Colors.deepPurple),
    Destination(4, 'Devices', Icons.device_hub, Colors.deepPurple),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center, // 置中
              children: [
                Icon(Icons.device_hub, size: 60.0),
                Text('Devices',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            onPressed: () => Navigator.pushNamed(context, '/devices'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, size: 60.0),
                Text('Settings',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications_on, size: 60.0),
                Text('Notification',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            onPressed: () => print("Devices"),
          ),
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.device_hub, size: 60.0),
                Text('Devices',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            onPressed: () => print("Devices"),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: allDestinations.map<NavigationDestination>(
          (Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon, color: destination.color),
              label: destination.title,
            );
          },
        ).toList(),
      ),
    );
  }
}

// Buttons
// https://m3.material.io/components/buttons/guidelines#4e89da4d-a8fa-4e20-bb8d-b8a93eff3e3e

class Destination {
  // constructor
  const Destination(this.index, this.title, this.icon, this.color);
  // properties
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
