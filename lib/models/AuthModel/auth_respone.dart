class AuthResponse {
  bool? status;
  String? message;
  String? token;
  Data? data;
  String? id;

  AuthResponse({this.status, this.message, this.token, this.data, this.id});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Data {
  String? userName;
  String? imageUrl;

  Data({this.userName, this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userName'] = userName;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
