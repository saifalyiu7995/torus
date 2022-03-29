class ChangePasswordRequest {
  String? userEmail;
  String? otp;
  String? newPassword;

  ChangePasswordRequest({this.userEmail, this.otp, this.newPassword});

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    otp = json['otp'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['otp'] = this.otp;
    data['newPassword'] = this.newPassword;
    return data;
  }
}
