import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        onSubmitted: (text) {
          setState(() {
            // _search = text.trim();
            // _offset = 0;
          });
        },
        decoration: const InputDecoration(
          labelText: "Search",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0),
          ),
        ),
        style: const TextStyle(color: Colors.black, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
