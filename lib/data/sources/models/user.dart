class User {
  String id;
  String title;
  String description;
  String images;
  String idUser;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.idUser,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        images: json["images"],
        idUser: json["id_user"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "images": images,
        "id_user": idUser,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
