import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shoppingcarts_state.dart';

class ShoppingcartsCubit extends Cubit<ShoppingcartsState> {
  ShoppingcartsCubit() : super(ShoppingcartsInitial());
  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/Menu Photo (1).png',
      'price': 35,
      'title': 'Herbal Pancake',
      'subtitle': 'Warung Herbal',
      'quantite': 1
    },
    {
      'image': 'assets/Menu Photo (2).png',
      'price': 35,
      'title': 'Fruit Salad',
      'subtitle': 'Wijie Resto',
      'quantite': 1
    },
    {
      'image': 'assets/Menu Photo (3).png',
      'price': 35,
      'title': 'Green Noddle',
      'subtitle': 'Noodle Home',
      'quantite': 1,
    }
  ];
  double price = 0;
  List<int> itemselected = [];
  List<Map<String, dynamic>> shoppingcart = [];

  void totalprice() {
    if (shoppingcart.isNotEmpty) {
      price = shoppingcart.fold(0, (sum, prodacat) => sum + prodacat['price']);
      emit(increases());
    } else {
      price = 0;
      emit(decreases());
    }
  }

  void productsselected({required int index}) {
    if (itemselected.contains(index)) {
      itemselected.remove(index);

      emit(removeselect());
    } else {
      itemselected.add(index);
      emit(select());
    }
    if (itemselected.isNotEmpty) {
      itemselected.forEach((index) {
        var products = items[index];
        if (!shoppingcart.contains(products)) {
          shoppingcart.add(products);
        }
      });
      emit(seclecteditems());
    } else {
      emit(notseclected());
    }
  }

  void decrement({required int index}) {
    if (shoppingcart[index]['quantite'] > 1) {
      shoppingcart[index]['quantite']--;
      price = shoppingcart.fold(
          0, (sum, prodacat) => sum + prodacat['quantite'] * prodacat['price']);
      emit(decreases());
    }
  }

  void incrementitems({required int index}) {
    if (shoppingcart[index]['quantite'] < 20) {
      shoppingcart[index]['quantite']++;
      price = shoppingcart.fold(
          0, (sum, prodacat) => sum + prodacat['quantite'] * prodacat['price']);

      emit(increases());
    }
  }
}
