class Chef {
  String? id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String gender;
  List<String> foodTypes;
  String? image;

  Chef({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.foodTypes,
    this.image,
  });

  factory Chef.fromJson(Map<String, dynamic> json) => Chef(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        gender: json["gender"],
        foodTypes: List<String>.from(json["foodTypes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "image": image,
        "gender": gender,
        "foodTypes": foodTypes,
      };
}
