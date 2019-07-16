class SignInModel {
  String _message;
  bool _created;

  SignInModel({String message, bool created}) {
    this._message = message;
    this._created = created;
  }

  String get message => _message;

  set message(String message) => _message = message;

  bool get created => _created;

  set created(bool created) => _created = created;

  SignInModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _created = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['verified'] = this._created;
    return data;
  }
}
