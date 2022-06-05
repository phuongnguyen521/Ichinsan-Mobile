import 'package:flutter/material.dart';
//Screen: package:ichinsan_mobile/
import './screens/dashboard.dart';
import './screens/home.dart';
import 'screens/progress/progress.dart';
import 'screens/profilescreen.dart';
//Fire core
import 'package:firebase_core/firebase_core.dart';

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
      home: const IchinsanPage(title: 'Ichinsan-MobileApp'),
    );
  }
}

class IchinsanPage extends StatefulWidget {
  const IchinsanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<IchinsanPage> createState() => _IchinsanState();
}

class _IchinsanState extends State<IchinsanPage> {
  int currentIndex = 0;
  final screens = [
    Home(),
    Dashboard(),
    Progress(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.menu),
            label: 'Dashboard',
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
