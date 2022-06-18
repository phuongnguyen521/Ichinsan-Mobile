import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/DatePicker.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/categories.dart';
import 'package:ichinsan_mobile/widgets/home_widget/titletext.dart';

import '../../constants/Theme.dart';
import '../../constants/network.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage>{


  List<Categories> listcategory = <Categories>[];
  List<Language> listlanguage = <Language>[];

  List<int> selectedCategories = [];
  List<int> selectedLanguages = [];

  List<String> salarylist = ["100", "200", "300"];
  List<int> selectedSalary = [];
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

  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text ('Filter Search'),
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
                children: List<Widget>.generate(listcategory.length, (index){
                  final listitem = listcategory[index];
                  final isSelected = selectedCategories.contains(listitem.id);
                  return FilterChip(
                      label: Text(listitem.name.toString()),
                    labelStyle: TextStyle(
                      color: isSelected
                        ? NowUIColors.white
                        : NowUIColors.muted,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: isSelected,
                    selectedColor: NowUIColors.active,
                    checkmarkColor: Colors.white,
                    onSelected: (bool selected) {
                        setState((){
                          if(selected){
                            selectedCategories.add(listitem.id);
                          }else{
                            selectedCategories.remove(listitem.id);
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
                children: List<Widget>.generate(listlanguage.length, (index){
                  final listitem = listlanguage[index];
                  final isSelected = selectedLanguages.contains(listitem.id);
                  return FilterChip(
                    label: Text(listitem.name.toString()),
                    labelStyle: TextStyle(
                      color: isSelected
                          ? NowUIColors.white
                          : NowUIColors.muted,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: isSelected,
                    selectedColor: NowUIColors.active,
                    checkmarkColor: Colors.white,
                    onSelected: (bool selected) {
                      setState((){
                        if(selected){
                          selectedLanguages.add(listitem.id!);
                        }else{
                          selectedLanguages.remove(listitem.id!);
                        }
                      });
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
                     Text("Type Salary Here",
                          style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: size.width *0.3,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "From",
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        Container(
                          height: 35,
                          width: size.width *0.3,
                          child: TextField(
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
                children: [
                  Text("Date Post",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )),
                  DatePicker(),

                  SizedBox(height: 5),

                  Text("Deadline Apply",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )),
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
                        width: size.width * 0.4,
                        color: NowUIColors.primary,
                      child:
                      TextButton(
                          onPressed: (){},
                          child:
                          Text("Reset",
                              style: TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.4,
                      color: NowUIColors.primary,
                      child:
                      TextButton(
                        onPressed: (){},
                        child:
                        Text("Apply",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )),
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

