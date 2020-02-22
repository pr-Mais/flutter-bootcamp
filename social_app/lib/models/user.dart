class User {
  int id;
  String name;
  String email;
  String website;

  User({
    this.id,
    this.name,
    this.email,
    this.website,
  });

  factory User.fromJson(Map json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        website: json['website']);
  }
}
