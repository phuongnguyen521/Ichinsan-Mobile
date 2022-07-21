import 'package:flutter/material.dart';
//Screen: package:ichinsan_mobile/
import './screens/wallet.dart';
import './screens/home.dart';
import './store/AppStore.dart';
import 'constants/Ichinsan_constant.dart';
import 'screens/progress/progress.dart';
import 'screens/profile/profilescreen.dart';
//Fire core
import 'package:firebase_core/firebase_core.dart';

AppStore appStore = AppStore();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Ichinsan());
}

class Ichinsan extends StatelessWidget {
  const Ichinsan({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ichinsan-MobileApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: IchinsanPage(title: 'Ichinsan-MobileApp', index: 0),
    );
  }
}

class IchinsanPage extends StatefulWidget {
  final int index;
  IchinsanPage({Key? key, required this.title, required this.index})
      : super(key: key);

  final String title;

  @override
  State<IchinsanPage> createState() => _IchinsanState();
}

class _IchinsanState extends State<IchinsanPage> {
  var firstTime = true;
  int currentIndex = 0;
  final screens = [
    Home(),
    Progress(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.index > 0 && firstTime) {
      currentIndex = widget.index;
      firstTime = false;
    }
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_rounded),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
