class User {
  final String name;

  User({
    required this.name
  });

  Map<String, dynamic> toJson(){
    return {
      "name": name
    };
  }
}