import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/network.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/FilterPage.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import '../../constants/articles.dart';
import '../home_widget/articleview.dart';

final Map<String, String> Flag = {
  "VietNam": "assets/imgs/vietnam.png",
  "English": "assets/imgs/english.jpg",
  "Japanese": "assets/imgs/japanese.jpg"
};

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<Articles> list = <Articles>[];
  List<Articles> display_list = <Articles>[];

  /*FetchArticles _list = FetchArticles();*/

  @override
  void initState() {
    // TODO: inplement initState
    fetchArticles().then((value) {
      setState(() {
        list.addAll(value);
        display_list = list;
      });
    });
    super.initState();
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
                    width: size.width *0.8,
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
                        decoration: InputDecoration(hintText: 'Search...'),
                        onChanged: (text) {
                          text = text.toLowerCase();
                          setState(() {
                            display_list = list.where((list) {
                              var title = list.title!.toLowerCase();
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
                          MaterialPageRoute(builder: (context) => const FilterPage()),
                      );
                    },
                      )
                ],
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
        category: display_list[index].category.toString(),
        title: display_list[index].title.toString(),
        languagefrom: returnLanguageData(
            display_list[index], display_list[index].languagefrom.toString()),
        languageto: returnLanguageData(
            display_list[index], display_list[index].languageto.toString()),
        coin: display_list[index].coin.toString(),
        deadline: display_list[index].deadline.toString(),
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
  String returnLanguageData(Articles detail, String s) {
    var result = "";
    Flag.forEach((key, value) {
      if (key.contains(s)) {
        result = value;
      }
    });
    return result;
  }
}
