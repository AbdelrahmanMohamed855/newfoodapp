part of 'shoppingcarts_cubit.dart';

@immutable
sealed class ShoppingcartsState {}

final class ShoppingcartsInitial extends ShoppingcartsState {}

final class add extends ShoppingcartsState {}

final class poses extends ShoppingcartsState {}

final class seclecteditems extends ShoppingcartsState {}

final class notseclected extends ShoppingcartsState {}

final class select extends ShoppingcartsState {}

final class removeselect extends ShoppingcartsState {}

final class increases extends ShoppingcartsState {}

final class decreases extends ShoppingcartsState {}
