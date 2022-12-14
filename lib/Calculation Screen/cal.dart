import 'package:cgpa_all_uni/util/variables.dart';

void Calculate(){

  //NSU
  if (globalCardIndex == 1) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A":
            doubleTempGrade = 4.0;
            break;
          case "A-":
            doubleTempGrade = 3.7;
            break;
          case "B+":
            doubleTempGrade = 3.3;
            break;
          case "B":
            doubleTempGrade = 3.0;
            break;
          case "B-":
            doubleTempGrade = 2.7;
            break;
          case "C+":
            doubleTempGrade = 2.3;
            break;
          case "C":
            doubleTempGrade = 2.0;
            break;
          case "C-":
            doubleTempGrade = 1.7;
            break;
          case "D+":
            doubleTempGrade = 1.3;
            break;
          case "D":
            doubleTempGrade = 1.0;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //EWU
  else if (globalCardIndex == 2) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A+":
            doubleTempGrade = 4.0;
            break;
          case "A":
            doubleTempGrade = 4.0;
            break;
          case "A-":
            doubleTempGrade = 3.7;
            break;
          case "B+":
            doubleTempGrade = 3.3;
            break;
          case "B":
            doubleTempGrade = 3.0;
            break;
          case "B-":
            doubleTempGrade = 2.7;
            break;
          case "C+":
            doubleTempGrade = 2.3;
            break;
          case "C":
            doubleTempGrade = 2.0;
            break;
          case "C-":
            doubleTempGrade = 1.7;
            break;
          case "D+":
            doubleTempGrade = 1.3;
            break;
          case "D":
            doubleTempGrade = 1.0;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //UIU
  else if (globalCardIndex == 7) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A":
            doubleTempGrade = 4.0;
            break;
          case "A-":
            doubleTempGrade = 3.67;
            break;
          case "B+":
            doubleTempGrade = 3.33;
            break;
          case "B":
            doubleTempGrade = 3.0;
            break;
          case "B-":
            doubleTempGrade = 2.67;
            break;
          case "C+":
            doubleTempGrade = 2.33;
            break;
          case "C":
            doubleTempGrade = 2.0;
            break;
          case "C-":
            doubleTempGrade = 1.67;
            break;
          case "D+":
            doubleTempGrade = 1.33;
            break;
          case "D":
            doubleTempGrade = 1.0;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //NU
  else if (globalCardIndex == 0) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A":
            doubleTempGrade = 4.0;
            break;
          case "A-":
            doubleTempGrade = 3.67;
            break;
          case "B+":
            doubleTempGrade = 3.33;
            break;
          case "B":
            doubleTempGrade = 3.0;
            break;
          case "B-":
            doubleTempGrade = 2.67;
            break;
          case "C+":
            doubleTempGrade = 2.33;
            break;
          case "C":
            doubleTempGrade = 2.0;
            break;
          case "C-":
            doubleTempGrade = 1.67;
            break;
          case "D+":
            doubleTempGrade = 1.33;
            break;
          case "D":
            doubleTempGrade = 1.0;
            break;
          case "D-":
            doubleTempGrade = 0.7;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //GUB, ISU, AUST, DU
  else if (globalCardIndex == 3 || globalCardIndex == 4 || globalCardIndex == 5 || globalCardIndex == 8) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A+":
            doubleTempGrade = 4.0;
            break;
            case "A":
            doubleTempGrade = 3.75;
            break;
          case "A-":
            doubleTempGrade = 3.50;
            break;
          case "B+":
            doubleTempGrade = 3.25;
            break;
          case "B":
            doubleTempGrade = 3.0;
            break;
          case "B-":
            doubleTempGrade = 2.75;
            break;
          case "C+":
            doubleTempGrade = 2.50;
            break;
          case "C":
            doubleTempGrade = 2.25;
            break;
          case "D":
            doubleTempGrade = 2.00;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //AIUB
  else if (globalCardIndex == 6) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A+":
            doubleTempGrade = 4.0;
            break;
            case "A":
            doubleTempGrade = 3.75;
            break;
          case "B+":
            doubleTempGrade = 3.50;
            break;
          case "B":
            doubleTempGrade = 3.25;
            break;
          case "C+":
            doubleTempGrade = 3.0;
            break;
          case "C":
            doubleTempGrade = 2.75;
            break;
          case "D+":
            doubleTempGrade = 2.50;
            break;
          case "D":
            doubleTempGrade = 2.25;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //SAU
  else if (globalCardIndex == 9) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A+":
            doubleTempGrade = 4.0;
            break;
            case "A":
            doubleTempGrade = 3.75;
            break;
            case "A-":
            doubleTempGrade = 3.50;
            break;
          case "B+":
            doubleTempGrade = 3.25;
            break;
          case "B":
            doubleTempGrade = 3.00;
            break;
          case "B-":
            doubleTempGrade = 2.75;
            break;
          case "C":
            doubleTempGrade = 2.50;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  //ULAB
  else if (globalCardIndex == 10) {
    double sum = 0.0;
    double creditSum = 0.0;
    if(grades.isEmpty){
      cgpa = 0.0;
    }else{
      for (int i = 0; i < grades.length; i++) {
        switch(grades[i]){
          case "A+":
            doubleTempGrade = 4.0;
            break;
            case "A":
            doubleTempGrade = 4.0;
            break;
          case "A-":
            doubleTempGrade = 3.8;
            break;
          case "B+":
            doubleTempGrade = 3.3;
            break;
          case "B":
            doubleTempGrade = 3.0;
            break;
          case "B-":
            doubleTempGrade = 2.8;
            break;
          case "C+":
            doubleTempGrade = 2.5;
            break;
          case "C":
            doubleTempGrade = 2.2;
            break;
          case "D":
            doubleTempGrade = 1.5;
            break;
          case "F":
            doubleTempGrade = 0.0;
            break;
          default:
            doubleTempGrade = -1.0;
            print("Wrong Grade Selected");
        }
        if(doubleTempGrade != -1.0){
          wrongGradeChecker = false;
          sum = sum + doubleTempGrade * credits[i];
          creditSum = creditSum + credits[i];
        }else{
          wrongGradeChecker = true;
        }
      }
      cgpa = sum / creditSum;
    }

  }
  else {
    print("Wrong Card");
  }
}