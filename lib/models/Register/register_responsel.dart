class RegisterResponse {
  bool? status;
  String? message;
  String? token;
  RegisterData? data;
  String? id;

  RegisterResponse({this.status, this.message, this.token, this.data, this.id});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
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

class RegisterData {
  String? userName;
  String? imageUrl;

  RegisterData({this.userName, this.imageUrl});

  RegisterData.fromJson(Map<String, dynamic> json) {
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
