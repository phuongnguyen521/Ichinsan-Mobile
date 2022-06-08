import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

class Wallet extends StatefulWidget {
  @override
  WalletState createState() => WalletState();
}

class WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {}, icon: Icon(Icons.menu) // Thay cho Icon App
        //     ),
        title: Center(
          child: Text('Wallet'),
        ),
      ),
      body: Center(
        child: Text("Wallet"),
      ),
    );
  }
}
