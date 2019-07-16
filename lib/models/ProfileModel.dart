class ProfileModel {
  String _firstName;
  String _lastName;
  String _email;

  ProfileModel({String firstName, String lastName, String email}) {
    this._firstName = firstName;
    this._lastName = lastName;
    this._email = email;
  }

  String get firstName => _firstName;

  set firstName(String firstName) => _firstName = firstName;

  String get lastName => _lastName;

  set lastName(String lastName) => _lastName = lastName;

  String get email => _email;

  set email(String email) => _email = email;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['email'] = this._email;
    return data;
  }
}
