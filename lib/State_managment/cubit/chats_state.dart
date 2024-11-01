part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class showchats extends ChatsState {}

final class getdate extends ChatsState {}

final class emptydate extends ChatsState {}

final class save extends ChatsState {}
