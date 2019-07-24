import 'dart:ui';

class GradesList {
  final List<GradesModel> grades;

  GradesList({
    this.grades,
  });

  factory GradesList.fromJson(List<dynamic> parsedJson) {
    List<GradesModel> grades = new List<GradesModel>();
    grades = parsedJson.map((i) => GradesModel.fromJson(i)).toList();

    return new GradesList(grades: grades);
  }
}

class GradesModel {
  int _id;
  String _nameEn;
  String _nameAr;

  GradesModel({int id, String nameEn, String nameAr}) {
    this._id = id;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get nameEn => _nameEn;

  set nameEn(String nameEn) => _nameEn = nameEn;

  String get nameAr => _nameAr;

  set nameAr(String nameAr) => _nameAr = nameAr;

  GradesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    return data;
  }


  String name(Locale locale) {
    if (locale.languageCode == 'en') {
      return nameEn;
    }
    return nameAr;
  }
}
