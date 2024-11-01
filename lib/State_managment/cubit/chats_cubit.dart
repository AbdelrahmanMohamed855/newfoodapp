import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_food_app/data/chachhelper.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());
  var chach = Cachhelper();
  String? resolt1;
  String? resolt2;
  bool isLogin = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<String> chats = [];

  TextEditingController chat = TextEditingController();
  List<Map<String, dynamic>> service = [
    {
      'image': 'assets/Photo Profile.png',
      'time': 14,
      'title': 'Anamwp',
    },
    {
      'image': 'assets/Photo Profile (1).png',
      'time': 15,
      'title': 'Guy Hawkins',
    },
    {
      'image': 'assets/Photo Profile (2).png',
      'time': 16,
      'title': 'Leslie Alexander',
    }
  ];
  void chatlink() {
    if (chat.text.isNotEmpty) {
      chats.add(chat.text);
      emit(showchats());
    }
  }

  void savedata() {
    chach.setData(key: 'email', value: email.text);
    chach.setData(key: 'password', value: password.text);
    emit(save());
  }

  void get() {
    resolt1 = chach.getData(key: 'email');
    resolt2 = chach.getData(key: 'password');

    if (resolt1 != null && resolt2 != null) {
      email.text = resolt1!;
      password.text = resolt2!;
      print('Retrieved data: email: $resolt1, password: $resolt2');

      emit(getdate());
    } else {
      emit(emptydate());
    }
  }
}
