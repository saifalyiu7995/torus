class ForgetRequest {
  String? status;
  String? token;

  ForgetRequest({this.status, this.token});

  ForgetRequest.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['token'] = token;
    return data;
  }
}
