
class User {
    final String username;
    final String email;
    final dynamic image;
    final dynamic genre;
    final String uid;

    User({
        required this.username,
        required this.email,
        required this.image,
        required this.genre,
        required this.uid,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["Username"],
        email: json["Email"],
        image: json["Image"],
        genre: json["Genre"],
        uid: json["uid"],
    );

}