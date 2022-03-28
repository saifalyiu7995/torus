class OTPRequest {
  String? otp;
  String? token;

  OTPRequest({this.otp, this.token});

  OTPRequest.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['otp'] = otp;
    data['token'] = token;
    return data;
  }
}
