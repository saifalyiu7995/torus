class ForgetResponse {
  bool? status;
  String? message;
  String? token;
  String? id;

  ForgetResponse({this.status, this.message, this.token, this.id});

  ForgetResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}
