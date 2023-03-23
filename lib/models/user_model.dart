class NormalUser {
  String? id;
  String name;
  String email;
  String phone;
  String address;
  String image;
  String gender;

  NormalUser({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
    required this.gender,
  });

  factory NormalUser.fromJson(Map<String, dynamic> json) => NormalUser(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "image": image,
        "gender": gender,
      };
}
