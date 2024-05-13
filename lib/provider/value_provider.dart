import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueProvider extends ChangeNotifier{
  bool _isChecked = false;
  bool _isloading = false;
  int _selectRadioValue= 0;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;




  bool get isChecked => _isChecked;
  bool get isLoading => _isloading;
  int get selectRadioValue => _selectRadioValue;
  get selectedDate => _selectedDate;
  get selectedTime => _selectedTime;


  void setChecked(bool value){
    _isChecked = value;
    notifyListeners();
  }

  void setLoading(bool value){
    _isloading = value;
    notifyListeners();
  }

  void setRadio(int value){
    print(value);
    _selectRadioValue = value;
    notifyListeners();
  }

  void setSelectedDate(DateTime? picked){
    _selectedDate = picked;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay? picked){
    _selectedTime = picked;
    notifyListeners();
  }
}