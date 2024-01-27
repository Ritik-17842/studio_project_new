import 'package:flutter/cupertino.dart';

class NumberListProvider extends ChangeNotifier{
  List<int> numList = [1];

  void add(){
    int num = numList.last;
    num++;
    numList.add(num);
    notifyListeners();
  }
  void sub(){
    numList.removeLast();
    notifyListeners();
  }
}