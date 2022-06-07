import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search>{

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
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
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            suffixIcon: Icon(Icons.zoom_in),
          ),
        ),
      ),
    );
  }
}