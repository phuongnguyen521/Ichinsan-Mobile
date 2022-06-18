import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/categories.dart';
import 'package:ichinsan_mobile/widgets/home_widget/titletext.dart';

import '../../constants/Theme.dart';
import '../../constants/network.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  List<Categories> listcategory = <Categories>[];
  List<int> selectedCategories = [];

  List<Language> listlanguage = <Language>[];
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: "Category"),
            Wrap(
              spacing: 10,
              children: List<Widget>.generate(listcategory.length, (index) {
                final listitem = listcategory[index];
                final isSelected = selectedCategories.contains(listitem.id);
                return FilterChip(
                  label: Text(listitem.name.toString()),
                  labelStyle: TextStyle(
                    color: isSelected ? NowUIColors.white : NowUIColors.muted,
                    fontWeight: FontWeight.bold,
                  ),
                  selected: isSelected,
                  selectedColor: NowUIColors.active,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(listitem.id);
                      } else {
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
                  selectedColor: NowUIColors.active,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedLanguages.add(listitem.id!);
                      } else {
                        selectedLanguages.remove(listitem.id!);
                      }
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 5),
            TitleText(title: "Salary"),
            SizedBox(height: 5),

            /*TitleText(title: "Date Post"),

            SizedBox(height: 5),*/
          ],
        ),
      ),
    );
  }
}
