import 'package:flutter/material.dart';

import '../bottom_bar.dart';
import '../util/list.dart';
import '../util/variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          //Search Box
          SizedBox(
            height: 55,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          //Quick Access
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 23,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black12,
                    width: 2
                )
            ),
            child: const Text(
              "     Quick Access",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.005,
          ),
          //Horizontal Row
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                  )
              ),
              /*child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ,
                ),*/
            child: GridView.builder(
                itemCount: uniList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 130,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0
                ), itemBuilder: (BuildContext context, index){
                  return SizedBox(
                    child: GestureDetector(
                      onTap: (){
                        cgpa = 0.0;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomBar(bottomIndex: 1, cardIndex: index,),
                        ));
                        /*Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const CalculationScreen(),
                                )
                            );*/
                      },
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.015,
                            ),
                            Image(
                              image: AssetImage(
                                  "assets/images/${uniList[index]['image']}"
                                //'${uniList[index]['image']}'
                              ),
                              height: 60,
                              width: 70,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.01,
                            ),
                            Text(
                              '${uniList[index]['short']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
            }
            ),
              ),
        ],
      ),
    );
  }
}

