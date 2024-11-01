part of 'foodshop_cubit.dart';

@immutable
sealed class FoodshopState {}

final class FoodshopInitial extends FoodshopState {}

final class invisible extends FoodshopState {}

final class notinvisible extends FoodshopState {}

final class add extends FoodshopState {}

final class remove extends FoodshopState {}

final class itemsseclected extends FoodshopState {}

final class notitemsseclected extends FoodshopState {}
