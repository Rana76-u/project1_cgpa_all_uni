import 'package:flutter/material.dart';

import '../bottom_bar.dart';
import '../util/list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _foundUnis = [];
  @override
  void initState() {
    _foundUnis = uniList;
    super.initState();
  }

  void _runFilter(String value){
    List<Map<String, dynamic>> results = [];
    if(value.isEmpty){
      results = uniList;
    }else{
      results = uniList.where((uni) => uni["short"].toLowerCase().contains(value.toLowerCase())).toList();
    }

    setState(() {
      _foundUnis = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin : const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.08,
              child: Card(
                elevation: 5,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Type the short form of your university name",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.white,
                    labelText: "Search Your University",
                  ),
                  controller: _searchController,
                  onChanged: (value){
                    _runFilter(value);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foundUnis.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_foundUnis[index]['id']),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Image(
                        image: AssetImage(
                            "assets/images/${_foundUnis[index]['image']}"
                        ),
                        height: 50,
                        width: 50,
                      ),
                      title: Text(
                        _foundUnis[index]['short'],
                        //style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        _foundUnis[index]['name'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomBar(bottomIndex: 1, cardIndex: _foundUnis[index]['id'],),
                          ),
                          );
                        });
                      },
                    ),
                  );
                }
          ),
            ),
          ]
        ),
      ),
    );
  }
}