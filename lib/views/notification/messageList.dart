import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageList();
}

class _MessageList extends State<MessageList>
    with TickerProviderStateMixin<MessageList> {
  static const List<MessageData> allMessageData = <MessageData>[
    MessageData(1, '192.168.202.1', "Device A", "has disconnected.",
        "2024/07/19 11:30"),
    MessageData(2, '192.168.202.2', "Device B", "has disconnected.",
        "2024/07/18 10:30"),
    MessageData(3, '192.168.202.3', "Device C", "has disconnected.",
        "2024/07/17 11:39"),
    MessageData(4, '192.168.202.4', "Device D", "has disconnected.",
        "2024/07/16 09:30"),
    MessageData(5, '192.168.202.5', "Device E", "has disconnected.",
        "2024/07/15 23:30"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        itemCount: allMessageData.length,
        itemBuilder: (BuildContext context, int index) {
          final message = allMessageData[index];
          return Row(
            children: <Widget>[
              const Icon(
                Icons.announcement_rounded, 
                color: Colors.deepPurpleAccent, 
                size: 28,
              ),
              Expanded(child: _MessageTile(ip: message.ip, systemName: message.systemName, event: message.event, timestamp: message.timestamp,),),
            ],
          );
          
          
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
  }
}

// Padding
// https://api.flutter.dev/flutter/widgets/Padding-class.html

// TextStyle
// https://api.flutter.dev/flutter/painting/TextStyle-class.html

// EdgeInsets
// https://api.flutter.dev/flutter/painting/EdgeInsets-class.html

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    required this.ip,
    required this.systemName, 
    required this.event,
    required this.timestamp
  });

  // Flutter: Dart parameter & required
  // https://blog.csdn.net/ftell/article/details/127094653

  final String ip;
  final String systemName;
  final String event;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,  // Justify-Contents的概念
      children: [
        ListTile(
          title: Text(
            ip, style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("$systemName $event"),
        ),
        Text(timestamp, style: const TextStyle(color: Colors.black54,),)
      ],
    );
  }
}

class MessageData {
  // constructor
  const MessageData(
      this.id, this.ip, this.systemName, this.event, this.timestamp);
  // properties
  final int id;
  final String ip;
  final String systemName;
  final String event;
  final String timestamp;
}

// Card
// https://m3.material.io/components/cards/specs
// https://api.flutter.dev/flutter/material/Card-class.html

// ListTile
// https://api.flutter.dev/flutter/material/ListTile-class.html