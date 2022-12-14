import 'package:cgpa_all_uni/Calculation%20Screen/cal.dart';
import 'package:cgpa_all_uni/util/list.dart';
import 'package:cgpa_all_uni/util/variables.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  final int index;

  const CalculationScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  List<DynamicWidget> listDynamic = [];
  final TextEditingController _txf1 = TextEditingController();
  final TextEditingController _txf2 = TextEditingController();

  addDynamic() {
    listDynamic.add(const DynamicWidget());
    setState(() {});
  }

  removeDynamic(int index) {
    listDynamic.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            //Problem is here
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              //Check If any Uni. is selected or not
              if (widget.index == -1) ...[
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "No university is selected",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const Text(
                        "Click on your university from homepage",
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                )
              ] else ...[
                Text(
                  '${uniList[widget.index]['name']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                //CGPA Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Your CGPA is: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      cgpa.toStringAsFixed(2),
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),

                //Creates a Area for Cards to show up
                ListView.builder(
                  itemCount: listDynamic.length,
                  itemBuilder: (_, index) {
                    listDynamic[index];
                    return Row(
                      children: [
                        Card(
                          elevation: 5,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              enabled: false,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: courseNames[index],
                                prefixIcon: const Icon(Icons.abc),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextField(
                                  enabled: false,
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText: credits[index]
                                        .toString(), //"Problem is here",
                                    prefixIcon: const Icon(Icons.onetwothree),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.185,
                                child: DropdownButton(
                                  items: const [
                                    DropdownMenuItem(
                                      value: "A",
                                      child: Text("A"),
                                    ),
                                    DropdownMenuItem(
                                      value: "B",
                                      child: Text("B"),
                                    ),
                                    DropdownMenuItem(
                                      value: "C",
                                      child: Text("c"),
                                    ),
                                    DropdownMenuItem(
                                      value: "D",
                                      child: Text("D"),
                                    ),
                                    DropdownMenuItem(
                                      value: "F",
                                      child: Text("F"),
                                    ),
                                  ],
                                  isExpanded: true,
                                  autofocus: true,
                                  hint: Text(
                                    grades[index]
                                        .toString(), //"Problem is here",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  elevation: 0,
                                  onChanged: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Delete Button
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            child: const Icon(
                              Icons.delete_sweep,
                            ),
                            onPressed: () {
                              setState(() {
                                listDynamic.removeAt(index);
                                courseNames.removeAt(index);
                                credits.removeAt(index);
                                grades.removeAt(index);
                                Calculate();
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  shrinkWrap: true,
                ),

                //Model Text Fields in Card
                Row(
                  children: [
                    //Course Name
                    Card(
                      elevation: 5,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextField(
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            hintText: "Course Name",
                            prefixIcon: Icon(Icons.abc),
                          ),
                          controller: _txf1,
                          onChanged: (str) {
                            tempCourseName = str;
                          },
                        ),
                      ),
                    ),

                    Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          //Credits
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                hintText: "Credits",
                                prefixIcon: Icon(Icons.onetwothree),
                              ),

                              /*inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],*/
                              keyboardType: TextInputType.number,
                              controller: _txf2,
                              onChanged: (value) {
                                tempCredits = double.tryParse(value)!;
                              },
                            ),
                          ),
                          //Grades
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.185,
                            child: DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  value: "A+",
                                  child: Text("A+"),
                                ),
                                DropdownMenuItem(
                                  value: "A",
                                  child: Text("A"),
                                ),
                                DropdownMenuItem(
                                  value: "A-",
                                  child: Text("A-"),
                                ),
                                DropdownMenuItem(
                                  value: "B+",
                                  child: Text("B+"),
                                ),
                                DropdownMenuItem(
                                  value: "B",
                                  child: Text("B"),
                                ),
                                DropdownMenuItem(
                                  value: "B-",
                                  child: Text("B-"),
                                ),
                                DropdownMenuItem(
                                  value: "C+",
                                  child: Text("C+"),
                                ),DropdownMenuItem(
                                  value: "C",
                                  child: Text("C"),
                                ),DropdownMenuItem(
                                  value: "C-",
                                  child: Text("C-"),
                                ),
                                DropdownMenuItem(
                                  value: "D+",
                                  child: Text("D+"),
                                ),
                                DropdownMenuItem(
                                  value: "D",
                                  child: Text("D"),
                                ),
                                DropdownMenuItem(
                                  value: "D-",
                                  child: Text("D-"),
                                ),
                                DropdownMenuItem(
                                  value: "F",
                                  child: Text("F"),
                                ),
                              ],
                              onChanged: (value) {
                                //tempGrades = double.tryParse(value!)!;
                                tempGrades = value!;
                              },
                              isExpanded: true,
                              autofocus: true,
                              hint: const Text(
                                "Grade",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Delete Button
                  ],
                ),
                //Add & Calculate Button
                Row(children: [
                  //ADD MORE Button
                  ElevatedButton(
                    onPressed: () {
                      if (tempCredits != 0.0 && tempGrades != "") {
                        courseNames.add(tempCourseName);
                        credits.add(tempCredits);
                        grades.add(tempGrades);

                        Calculate();
                        if(wrongGradeChecker == false){
                          addDynamic();
                        }else{
                          cgpa = 0.0;
                          courseNames.removeLast();
                          credits.removeLast();
                          grades.removeLast();
                        }

                        tempCourseName = "";
                        tempCredits = 0.0;
                        tempGrades = "";
                        _txf1.clear();
                        _txf2.clear();
                        isComplete = true;
                        setState(() {});
                      } else {
                        print("Input Required");
                        isComplete = false;
                        setState(() {});
                      }
                    },
                    child: const Text("ADD & CALCULATE"),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                ]),
                if (isComplete == false) ...[
                  Text(
                    "Credit & Grade are required*",
                    style: TextStyle(
                      color: Colors.red.shade300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]else if(wrongGradeChecker == true) ...[
                  Text(
                    "[Wrong Grade Selected]",
                    style: TextStyle(
                      color: Colors.red.shade300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                //Here
                const Divider(
                  height: 45,
                ),
                //Text
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: const [
                      Text(
                        "CGPA Calculation Process: Total sum of all (grades * credits) / Total Credits",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                //Image
                Container(
                  child: Image(
                    image: AssetImage(
                        'assets/images/${uniList[widget.index]['cg_image']}'),
                  ),
                ),
              ],
              //paste here
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicWidget extends StatefulWidget {
  const DynamicWidget({Key? key}) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
              enabled: false,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: courseNames.last,
                prefixIcon: const Icon(Icons.abc),
              ),
              //controller: TextEditingController(text: tempCourseName),
              //controller: tf1Controller,
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  enabled: false,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: credits.last.toString(), //"Problem is here",
                    prefixIcon: const Icon(Icons.onetwothree),
                  ),
                  /*inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],*/
                  keyboardType: TextInputType.number,
                  //controller: TextEditingController(text: tempCredits),
                  //controller: tf2Controller,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.185,
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: "A",
                      child: Text("A"),
                    ),
                    DropdownMenuItem(
                      value: "B",
                      child: Text("B"),
                    ),
                    DropdownMenuItem(
                      value: "C",
                      child: Text("c"),
                    ),
                    DropdownMenuItem(
                      value: "D",
                      child: Text("D"),
                    ),
                    DropdownMenuItem(
                      value: "F",
                      child: Text("F"),
                    ),
                  ],
                  isExpanded: true,
                  autofocus: true,
                  hint: Text(
                    grades.last.toString(), //"Problem is here",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 0,
                  onChanged: null,
                ),
              ),
            ],
          ),
        ),
        //Delete Button
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            child: const Icon(
              Icons.delete_sweep,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
