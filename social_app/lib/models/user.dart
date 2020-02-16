class User {
  int id;
  String name;
  String email;
  String website;

  User(
    this.id,
    this.name,
    this.email,
    this.website,
  );

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        website = json['website'];
}
