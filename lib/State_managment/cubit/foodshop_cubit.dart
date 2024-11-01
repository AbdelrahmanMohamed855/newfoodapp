import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'foodshop_state.dart';

class FoodshopCubit extends Cubit<FoodshopState> {
  FoodshopCubit() : super(FoodshopInitial());
  bool hidden = true;

  List<int> isselect = [];

  List<Map<String, dynamic>> food = [
    {'title': 'Cake'},
    {'title': 'Soup'},
    {'title': 'Main Course'},
    {'title': 'Appetizer'},
    {'title': 'Dessert'}
  ];
  List<Map<String, dynamic>> type = [
    {'title': 'Restaurant'},
    {'title': 'Menu'},
  ];
  List<Map<String, dynamic>> location = [
    {'title': '1 Km'},
    {'title': '>10 Km'},
    {'title': '<10 Km'},
  ];

  List<Map<String, dynamic>> typeselect = [];

  void hiddenpass() {
    if (hidden == true) {
      hidden = false;
      emit(invisible());
    } else {
      hidden = true;
      emit(notinvisible());
    }
  }

  void select({required int index}) {
    if (isselect.contains(index)) {
      isselect.remove(index);
      emit(remove());
    } else {
      isselect.add(index);
      emit(add());
    }
  }

  void itemsselect() {
    if (isselect.isNotEmpty) {
      isselect.forEach((index) {
        var items = food[index];
        if (!typeselect.contains(items)) {
          typeselect.add(items);
        }
      });
      emit(itemsseclected());
    } else {
      emit(notitemsseclected());
    }
  }
}
