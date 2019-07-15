class VerifyModel {
  String _token;

  VerifyModel({String token}) {
    this._token = token;
  }

  String get token => _token;

  set token(String token) => _token = token;

  VerifyModel.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    return data;
  }
}
