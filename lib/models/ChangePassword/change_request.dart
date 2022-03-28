class ChangeRequest {
  String? password;
  String? token;

  ChangeRequest({this.password, this.token});

  ChangeRequest.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}
