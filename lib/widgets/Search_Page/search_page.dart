import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/utils/network.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/FilterPage.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import '../../constants/api_constants.dart';
import '../../model/Article/articles.dart';
import '../home_widget/articleview.dart';
import '../../constants/common.dart';

import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<Articles> list = <Articles>[];
  List<Articles> display_list = <Articles>[];
  SearchOptions? _filter;

  late String sFilter;
  /*FetchArticles _list = FetchArticles();*/

  @override
  void initState() {
    super.initState();
    var categoryName= _filter!.selectedCategories.isNotEmpty ? '&category=${_filter?.selectedCategories}' : '';
    var language=_filter!.selectedLanguages.isNotEmpty ? '&category=${_filter?.selectedLanguages}' : '';
    var sFrom= _filter!.salaryFrom > 0 ? '&from=${_filter?.salaryFrom}' :'';
    var sTo=_filter!.salaryTo > 0 ? '&from=${_filter?.salaryTo}' :'';
    var datePost= _filter!.datePost.isNotEmpty ? '&datePost=${_filter?.datePost}' : '';
    var deadline=_filter!.deadline.isNotEmpty ? '&deadline=${_filter?.deadline}' : '';

    /*String postdate = checkNull(_filter?.datePost);
    String deadlinedate = checkNull(_filter?.datePost);

    var categoryName= '';
    var language='';

    var sFrom= '';
    var sTo='';
    var datePost= postdate != '' ? '&datePost=${_filter?.datePost}' : '';
    var deadline= deadlinedate != '' ? '&datePost=${_filter?.deadline}' : '';*/

    sFilter = categoryName + language + sFrom + sTo + datePost + deadline;
    // TODO: inplement initState
    fetchArticlesSearch(1,5, sFilter).then((value) {
      setState(() {
        list.addAll(value);
        display_list = list;
      })  ;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin:EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 45,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            color: Colors.grey.withOpacity(0.23),

                          ),]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        decoration: const InputDecoration(hintText: 'Search...'),
                        onChanged: (text) {
                          text = text.toLowerCase();
                          setState(() {
                            display_list = list.where((list) {
                              var title = list.name.toLowerCase();
                              return title.contains(text);
                            }).toList();
                          });
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_alt_rounded),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FilterPage(
                            onSetFilters: (filter){
                              _filter = filter;
                            },
                          )),
                      );
                    },
                      )
                ],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: display_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return list_items(index);
                  })
            ],
          ),
      ),
    );
  }

  list_items(index) {
    return CardHorizontal(
        cta: "Apply",
        category: display_list[index].categoryName.toString(),
        title: display_list[index].name.toString(),
        languagefrom: display_list[index].languageFrom,
        languageto: display_list[index].languageTo,
        coin: display_list[index].fee.toString(),
        deadline: IchinsanCommon.returnDate(display_list[index].deadline),
        description: display_list[index].description.toString(),
        tap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(articles: display_list[index],)
            ),
          );
        });
  }

String checkNull(String? str){
  if(str != null){
    str=str;
  }else{
    str='';
  }
  return str;
}
}
