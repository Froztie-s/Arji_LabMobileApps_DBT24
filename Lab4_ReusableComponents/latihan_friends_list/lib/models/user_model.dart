class User {
  final String id;
  final String name;
  final String email;
  
  var profilePic;
  var lastSeen;

  User({required this.id, required this.name, required this.email, required this.profilePic, required this.lastSeen});
}