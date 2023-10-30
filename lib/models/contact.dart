class Contact {
  int id;
  String name;
  String email;
  String phone;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
