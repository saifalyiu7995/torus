class ChangeResponse {
  bool? status;
  String? message;
  String? id;

  ChangeResponse({this.status, this.message, this.id});

  ChangeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
