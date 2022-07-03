import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ichinsan_mobile/model/Article/categories.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/search_page.dart';
import 'package:ichinsan_mobile/widgets/home_widget/titletext.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../../utils/network.dart';
import '../../constants/Ichinsan_string.dart';

class FilterPage extends StatefulWidget {
  /*const FilterPage({Key? key}) : super(key: key);*/

  final Function(SearchOptions filter) onSetFilters;
  FilterPage({required this.onSetFilters});

  final String salaryFrom = '0';
  final String salaryTo = '0';

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  List<Categories> listcategory = <Categories>[];
  List<Language> listlanguage = <Language>[];
  late SearchOptions _searchOptions;

  DateTime datetime = DateTime(2022, 6, 6);
  String post = Ichinsan_filter_label_date;
  String deadline = Ichinsan_filter_label_date;
  String slrFrom = '';
  String slrTo = '';
  /*final _ControllerFrom = TextEditingController();
  final _ControllerTo = TextEditingController();*/

  /*List<String> selectedCategories = [];*/
  /*List<String> selectedLanguages = [];*/

  @override
  void initState() {
    // TODO: inplement initState
    super.initState();
    _searchOptions = SearchOptions(
      salaryFrom: widget.salaryFrom,
      salaryTo: widget.salaryTo,
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
              //Category
              const TitleText(title: Ichinsan_filter_title_category),
              Wrap(
                spacing: 10,
                children: List<Widget>.generate(listcategory.length, (index) {
                  final listitem = listcategory[index];
                  final isSelected =
                      _searchOptions.selectedCategories.contains(listitem.name);
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
                          _searchOptions.selectedCategories.add(listitem.name!);
                        } else {
                          _searchOptions.selectedCategories
                              .remove(listitem.name);
                        }
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 5),
              //Language
              const TitleText(title: Ichinsan_filter_title_language),
              Wrap(
                spacing: 10,
                children: List<Widget>.generate(listlanguage.length, (index) {
                  final listitem = listlanguage[index];
                  final isSelected =
                      _searchOptions.selectedLanguages.contains(listitem.code);
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
                          _searchOptions.selectedLanguages
                              .remove(listitem.code);
                        }
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 5),
              //Salary
              const TitleText(title: Ichinsan_filter_title_salary),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(Ichinsan_filter_label_salary_default,
                          style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: size.width * 0.35,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter(RegExp(r'[0-9]'),
                                  allow: true)
                            ],
                            onChanged: (text) {
                              _searchOptions.salaryFrom = text ;
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              hintText:
                                  Ichinsan_filter_label_salary_from_default,
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        Container(
                          height: 35,
                          width: size.width * 0.35,
                          child: TextField(
                            onChanged: (text) {
                              _searchOptions.salaryTo = text;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter(RegExp(r'[0-9]'),
                                  allow: true)
                            ],
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: Ichinsan_filter_label_salary_to_default,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              //Date Post
              const TitleText(title: Ichinsan_filter_title_date_post),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Ichinsan_filter_title_date_post,
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              NowUIColors.white),
                        ),
                        child: Text(
                          post,
                          style: const TextStyle(
                              color: NowUIColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          final date = await pickDate();
                          if (date == null) return;
                          setState(() => datetime = date);
                          post =
                              "${datetime.year}/${datetime.month}/${datetime.day}";
                          _searchOptions.datePost=post;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(Ichinsan_filter_title_deadline_apply,
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  //DatePicker(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              NowUIColors.white),
                        ),
                        child: Text(
                          deadline,
                          style: const TextStyle(
                              color: NowUIColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          final date = await pickDate();
                          if (date == null) return;
                          setState(() => datetime = date);
                          deadline =
                              "${datetime.year}/${datetime.month}/${datetime.day}";

                          _searchOptions.deadline=deadline;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Reset
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.35,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: NowUIColors.info,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        //TO-DO:
                        onPressed: () {
                          setState((){
                            _searchOptions.selectedCategories=[];
                            _searchOptions.selectedLanguages=[];
                            post='';
                            deadline='';
                          });

                        },
                        child: const Text(Ichinsan_filter_title_reset,
                            style: TextStyle(
                                color: NowUIColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  //Apply
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.35,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: NowUIColors.info,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          widget.onSetFilters(_searchOptions);
                          //Navigator.pop(context,_searchOptions);

                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(filter: _searchOptions,) ));

                          /*IchinsanCommon.itemNavigatorPushAndRemove(
                              (context) => SearchPage(
                                    filter: _searchOptions,
                                  ),
                              context);*/
                        },
                        child: const Text(Ichinsan_filter_title_apply,
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
  List<String> selectedCategories = [];
  List<String> selectedLanguages = [];
  String salaryFrom;
  String salaryTo;
  String datePost;
  String deadline;

  SearchOptions(
      {required this.salaryFrom,
      required this.salaryTo,
      required this.datePost,
      required this.deadline});
  Map<String, dynamic> toJson() => {
        'salaryFrom': salaryFrom,
        'salaryTo': salaryTo,
        'datePost': datePost,
        'deadline': deadline,
        'category': selectedCategories.join(',')
      };
}
