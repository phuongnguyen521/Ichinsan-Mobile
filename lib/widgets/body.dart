import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import 'package:ichinsan_mobile/widgets/navbar.dart';
class Body extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
          NavBar(size: size),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CardHorizontal(
                    cta: "Apply",
                    title: "Article 1",
                    language: "Language: " + "English-VietNam",
                    coin: "Salary: " + "100",
                    deadline:"Deadline: " + "20/8/2022",
                    description:"Description " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                    tap: () {
                      Navigator.pushNamed(context, '/pro');
                    }),
              ),
              SizedBox(height: 8.0),
              CardHorizontal(
                  cta: "Apply",
                  title: "Article 2",
                  language: "Language: " + "English-VietNam",
                  coin: "Salary: " + "100",
                  deadline:"Deadline: " + "20/8/2022",
                  description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');
                  }),
              SizedBox(height: 8.0),
              CardHorizontal(
                  cta: "Apply",
                  title: "Article 3",
                  language: "Language: " + "English-VietNam",
                  coin: "Salary: " + "100",
                  deadline:"Deadline: " + "20/8/2022",
                  description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');
                  }),
              SizedBox(height: 8.0),
              CardHorizontal(
                  cta: "Apply",
                  title: "Article 4",
                  language: "Language: " + "English-VietNam",
                  coin: "Salary: " + "100",
                  deadline:"Deadline: " + "20/8/2022",
                  description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');
                  }),
              SizedBox(height: 8.0),
              CardHorizontal(
                  cta: "Apply",
                  title: "Article 5",
                  language: "Language: " + "English-VietNam",
                  coin: "Salary: " + "100",
                  deadline:"Deadline: " + "20/8/2022",
                  description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');
                  }),
            ],
          ),
        ]
      ),
    );
  }
}

