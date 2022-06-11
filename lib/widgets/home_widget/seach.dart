import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/search_page.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search>{

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        alignment: Alignment.center,
        margin:EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 45,
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
          padding: const EdgeInsets.only(bottom: 10),
          child: ListTile(

            title: const Text("Search..."),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage() )
              );
            },
          ),
        )
        /*TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            suffixIcon: Icon(Icons.search),
          ),
        ),*/

      ),
    );
  }
}