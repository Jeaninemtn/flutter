import 'package:flutter/material.dart';

import 'notification/messageList.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(text: "Announcement"),
              Tab(text: "Device"),
              Tab(text: "Events"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            Center(
              child: MessageList(),
            ),
            Center(
              child: MessageList(),
            ),
            Center(
              child: Text("C"),
            ),
          ],
        ));
  }
}

// TabBar
// https://api.flutter.dev/flutter/material/TabBar-class.html