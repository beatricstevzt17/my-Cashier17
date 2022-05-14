class Users {
    Users({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final String username;
    final String email;
    final String password;
    final String createdAt;
    final String updatedAt;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
