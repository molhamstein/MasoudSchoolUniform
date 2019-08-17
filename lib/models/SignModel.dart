class SignInModel {
  String _message;
  bool _created;
  String _code;

  SignInModel({String message, bool created, String code}) {
    this._message = message;
    this._created = created;
    this._code = code;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  String get message => _message;

  set message(String message) => _message = message;

  bool get created => _created;

  set created(bool created) => _created = created;

  SignInModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _created = json['verified'];
    _code =json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['verified'] = this._created;
    data['code'] = this._code ;
    return data;
  }
}
