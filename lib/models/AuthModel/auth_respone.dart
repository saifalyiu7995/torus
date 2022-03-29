class AuthResponse {
  String? message;
  String? status;
  Data? data;

  AuthResponse({this.message, this.status, this.data});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? fullname;

  Data({this.accessToken, this.fullname});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['fullname'] = this.fullname;
    return data;
  }
}
