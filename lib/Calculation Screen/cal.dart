import 'package:cgpa_all_uni/util/variables.dart';

void Calculate(){

  if (globalCardIndex == 1) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        sum = sum + grades[i] * credits[i];
        creditSum = creditSum + credits[i];
      }
      cgpa = sum / creditSum;
    }

  } else {
    print("Wrong Card");
  }
}