import 'dart:convert';

List<CemosUsers> CemosUsersFromJson(String str) =>
    List<CemosUsers>.from(json.decode(str).map((x) => CemosUsers.fromJson(x)));

String CemosUsersToJson(List<CemosUsers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CemosUsers {
  int id;
  String role;
  String name;
  String email;
  String address;
  String phone;

  CemosUsers({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
  });

  factory CemosUsers.fromJson(Map<String, dynamic> json) => CemosUsers(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
      };
}
