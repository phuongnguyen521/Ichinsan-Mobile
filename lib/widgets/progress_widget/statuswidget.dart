import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/status/status.dart';

class IchinsanStatus extends StatefulWidget {
  const IchinsanStatus({Key? key}) : super(key: key);

  @override
  State<IchinsanStatus> createState() => _IchinsanStatusState();
}

class _IchinsanStatusState extends State<IchinsanStatus> {
  List<Status> status = [];
  List<String?> list = [];

  @override
  void initState() {
    status = Status.translatorStatusList;
    list = status.map((e) => e.name).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
