abstract class UserEvent {}

class NewName extends UserEvent {
  final String name;
  NewName({required this.name});
}

//class UpdateNameEvent extends UserEvent {
//  final String name;
//  UpdateNameEvent({required this.name});
//}
