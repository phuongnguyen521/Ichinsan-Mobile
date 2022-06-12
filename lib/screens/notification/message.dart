import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IchinsanNotification extends StatefulWidget {
  const IchinsanNotification({Key? key}) : super(key: key);

  @override
  State<IchinsanNotification> createState() => _IchinsanNotificationState();
}

class _IchinsanNotificationState extends State<IchinsanNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: const Text('Notification')),
    );
  }
}
