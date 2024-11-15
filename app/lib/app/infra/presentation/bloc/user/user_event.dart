abstract class UserEvent {}

class NewName extends UserEvent {
  final String name;
  NewName({required this.name});
}

class RefreshUserDataEvent extends UserEvent {}

