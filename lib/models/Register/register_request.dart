class RegisterRequet {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? contact;
  String? country;

  RegisterRequet(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.contact,
      this.country});

  RegisterRequet.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    contact = json['contact'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['contact'] = contact;
    data['country'] = country;
    return data;
  }
}
