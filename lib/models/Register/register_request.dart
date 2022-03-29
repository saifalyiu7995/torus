class RegisterRequest {
  String? contactNo;
  String? companyName;
  String? country;
  String? firstName;
  String? lastName;
  String? password;
  String? email;

  RegisterRequest(
      {this.contactNo,
      this.companyName,
      this.country,
      this.firstName,
      this.lastName,
      this.password,
      this.email});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    contactNo = json['contactNo'];
    companyName = json['companyName'];
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactNo'] = this.contactNo;
    data['companyName'] = this.companyName;
    data['country'] = this.country;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
