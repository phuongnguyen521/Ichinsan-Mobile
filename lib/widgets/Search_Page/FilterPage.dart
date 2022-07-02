import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ichinsan_mobile/model/Article/categories.dart';
import 'package:ichinsan_mobile/widgets/home_widget/titletext.dart';

import '../../constants/Theme.dart';
import '../../utils/network.dart';

class FilterPage extends StatefulWidget {
  /*const FilterPage({Key? key}) : super(key: key);*/

  final Function (SearchOptions filter) onSetFilters;
  FilterPage({required this.onSetFilters});

  final double salaryFrom= 0;
  final double salaryTo= 10000;

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  List<Categories> listcategory = <Categories>[];
  List<Language> listlanguage = <Language>[];
  late SearchOptions _searchOptions;

  DateTime datetime = DateTime(2022, 6, 6);
  String post = "DD/MM/YY";
  String deadline = "DD/MM/YY";

  /*final _ControllerFrom = TextEditingController();
  final _ControllerTo = TextEditingController();*/

  /*List<String> selectedCategories = [];*/
  /*List<String> selectedLanguages = [];*/

  @override
  void initState() {
    // TODO: inplement initState
    super.initState();
    _searchOptions = SearchOptions(
        salaryFrom : widget.salaryFrom,
        salaryTo : widget.salaryTo,
        datePost: post,
        deadline: deadline,
    );
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
                  final isSelected = _searchOptions.selectedCategories.contains(listitem.code);
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
                          _searchOptions.selectedCategories.add(listitem.code!);
                        } else {
                          _searchOptions.selectedCategories.remove(listitem.code);
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
                  final isSelected = _searchOptions.selectedLanguages.contains(listitem.code);
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
                          _searchOptions.selectedLanguages.add(listitem.code!);
                        } else {
                          _searchOptions.selectedLanguages.remove(listitem.code);
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
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)],
                            onChanged: (text){
                              _searchOptions.salaryFrom = text as double;
                            },
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
                          child: TextField(
                            onChanged: (text){
                              _searchOptions.salaryTo = text as double;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)],
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
                        fontWeight: FontWeight.bold,
                      )),
                  //DatePicker(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all<Color>(NowUIColors.white),
                  ),
                  child: Text(post,
                    style: TextStyle(
                        color: NowUIColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () async{
                    final date = await pickDate();
                    if(date == null) return;
                    setState(() => datetime = date);
                    post = "${datetime.day}/${datetime.month}/${datetime.year}";

                  },
                ),
              ),

            ),
                  SizedBox(height: 5),
                  Text("Deadline Apply",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  //DatePicker(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(NowUIColors.white),
                        ),
                        child: Text(deadline,
                          style: TextStyle(
                              color: NowUIColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        onPressed: () async{
                          final date = await pickDate();
                          if(date == null) return;
                          setState(() => datetime = date);
                          deadline = "${datetime.day}/${datetime.month}/${datetime.year}";

                        },
                      ),
                    ),
                  ),
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
                        onPressed: () {
                          widget.onSetFilters(_searchOptions);
                        },
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

  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: datetime,
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
  );
}

class SearchOptions {
  List<String> selectedCategories =[];
  List<String> selectedLanguages = [];
  double salaryFrom;
  double salaryTo;
  String datePost;
  String deadline;

  SearchOptions({required this.salaryFrom, required this.salaryTo,required this.datePost,required this.deadline});
  Map<String, dynamic> toJson() => {
    'salaryFrom' : salaryFrom,
    'salaryTo' : salaryTo,
    'datePost' : datePost,
    'deadline' : deadline,
    'category' : selectedCategories.join(',')
  };
}
