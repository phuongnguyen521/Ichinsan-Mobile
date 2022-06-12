import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/model/User/user_mode.dart';
import 'package:ichinsan_mobile/utils/user_client.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

class Wallet extends StatefulWidget {
  @override
  WalletState createState() => WalletState();
}

class WalletState extends State<Wallet> {

  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await UserClient().fetchUser(1, 5));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

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
      body: _userModel == null || _userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_userModel![index].email.toString()),
                              Text(_userModel![index].profileId.toString()),
                              Text(_userModel![index].balance.toString())
                            ]),
                      ],
                    ),
                  );
                })
    );
  }
}
