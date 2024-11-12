class UserState {
  final String name;

  UserState({
    required this.name,
  });

  factory UserState.initial() {
    return UserState(
      name: '',
    );
  }

  UserState copyWith({
    String? name
  }) {
    return UserState(
      name: name ?? this.name
    );
  }

  @override
  String toString() {
    return '\n'
      'name: $name';
  }
}
