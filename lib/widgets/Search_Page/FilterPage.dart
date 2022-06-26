import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/DatePicker.dart';
import 'package:ichinsan_mobile/model/Article/categories.dart';
import 'package:ichinsan_mobile/widgets/home_widget/titletext.dart';

import '../../constants/Theme.dart';
import '../../utils/network.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  List<Categories> listcategory = <Categories>[];
  List<Language> listlanguage = <Language>[];

  List<String> selectedCategories = [];
  List<int> selectedLanguages = [];

  @override
  void initState() {
    // TODO: inplement initState
    fetchCategories().then((value) {
      setState(() {
        listcategory.addAll(value);
      });
    });
    fetchLanguage().then((value) {
      setState(() {
        listlanguage.addAll(value);
      });
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(title: "Category"),
              Wrap(
                spacing: 10,
                children: List<Widget>.generate(listcategory.length, (index) {
                  final listitem = listcategory[index];
                  final isSelected = selectedCategories.contains(listitem.code);
                  return FilterChip(
                    label: Text(listitem.name.toString()),
                    labelStyle: TextStyle(
                      color: isSelected ? NowUIColors.white : NowUIColors.muted,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: isSelected,
                    selectedColor: NowUIColors.info,
                    checkmarkColor: Colors.white,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedCategories.add(listitem.code!);
                        } else {
                          selectedCategories.remove(listitem.code);
                        }
                      });
                    },
                  );
                }),
              ),
              SizedBox(height: 5),
              TitleText(title: "Language"),
              Wrap(
                spacing: 10,
                children: List<Widget>.generate(listlanguage.length, (index) {
                  final listitem = listlanguage[index];
                  final isSelected = selectedLanguages.contains(listitem.id);
                  return FilterChip(
                    label: Text(listitem.name.toString()),
                    labelStyle: TextStyle(
                      color: isSelected ? NowUIColors.white : NowUIColors.muted,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: isSelected,
                    selectedColor: NowUIColors.info,
                    checkmarkColor: Colors.white,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedLanguages.add(listitem.id!);
                        } else {
                          selectedLanguages.remove(listitem.id!);
                        }});
                    },
                  );
                }),
              ),
              SizedBox(height: 5),
              TitleText(title: "Salary"),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text("Type Salary Here",
                          style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: size.width * 0.35,
                          child: const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "From",
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        Container(
                          height: 35,
                          width: size.width * 0.35,
                          child: const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "To",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              TitleText(title: "Date Post"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Date Post",
                      style: TextStyle(
                        color: NowUIColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  DatePicker(),
                  SizedBox(height: 5),
                  Text("Deadline Apply",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  DatePicker(),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.35,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: NowUIColors.info,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Reset",
                            style: TextStyle(
                                color: NowUIColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.35,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: NowUIColors.info,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Apply",
                            style: TextStyle(
                                color: NowUIColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
