class StatesList {
  final List<StatesModel> states;

  StatesList({
    this.states,
  });

  factory StatesList.fromJson(List<dynamic> parsedJson) {
    List<StatesModel> states = new List<StatesModel>();
    states = parsedJson.map((i) => StatesModel.fromJson(i)).toList();

    return new StatesList(states: states);
  }
}


class StatesModel {
  int _id;
  List<Centers> _centers;
  String _nameEn;
  String _nameAr;

  StatesModel({int id, List<Centers> centers, String nameEn, String nameAr}) {
    this._id = id;
    this._centers = centers;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
  }

  int get id => _id;
  set id(int id) => _id = id;
  List<Centers> get centers => _centers;
  set centers(List<Centers> centers) => _centers = centers;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  String get nameAr => _nameAr;
  set nameAr(String nameAr) => _nameAr = nameAr;

  StatesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['centers'] != null) {
      _centers = new List<Centers>();
      json['centers'].forEach((v) {
        _centers.add(new Centers.fromJson(v));
      });
    }
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._centers != null) {
      data['centers'] = this._centers.map((v) => v.toJson()).toList();
    }
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    return data;
  }
}

class Centers {
  int _id;
  List<int> _statesId;
  String _nameEn;
  String _nameAr;
  double _lat;
  double _lng;

  Centers(
      {int id,
        List<int> statesId,
        String nameEn,
        String nameAr,
        double lat,
        double lng}) {
    this._id = id;
    this._statesId = statesId;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._lat = lat;
    this._lng = lng;
  }

  int get id => _id;
  set id(int id) => _id = id;
  List<int> get statesId => _statesId;
  set statesId(List<int> statesId) => _statesId = statesId;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  String get nameAr => _nameAr;
  set nameAr(String nameAr) => _nameAr = nameAr;
  double get lat => _lat;
  set lat(double lat) => _lat = lat;
  double get lng => _lng;
  set lng(double lng) => _lng = lng;

  Centers.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _statesId = json['statesId'].cast<int>();
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['statesId'] = this._statesId;
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    return data;
  }
}


//
//class StatesModel {
//  int _id;
//  List<Centers> _centers;
//  String _nameEn;
//  String _nameAr;
//
//  StatesModel({int id, List<Centers> centers, String nameEn, String nameAr}) {
//    this._id = id;
//    this._centers = centers;
//    this._nameEn = nameEn;
//    this._nameAr = nameAr;
//  }
//
//  int get id => _id;
//
//  set id(int id) => _id = id;
//
//  List<Centers> get centers => _centers;
//
//  set centers(List<Centers> centers) => _centers = centers;
//
//  String get nameEn => _nameEn;
//
//  set nameEn(String nameEn) => _nameEn = nameEn;
//
//  String get nameAr => _nameAr;
//
//  set nameAr(String nameAr) => _nameAr = nameAr;
//
//  StatesModel.fromJson(Map<String, dynamic> json) {
//    _id = json['id'];
//    if (json['centers'] != null) {
//      _centers = new List<Centers>();
//      json['centers'].forEach((v) {
//        _centers.add(new Centers.fromJson(v));
//      });
//    }
//    _nameEn = json['nameEn'];
//    _nameAr = json['nameAr'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this._id;
//    if (this._centers != null) {
//      data['centers'] = this._centers.map((v) => v.toJson()).toList();
//    }
//    data['nameEn'] = this._nameEn;
//    data['nameAr'] = this._nameAr;
//    return data;
//  }
//}
//
//class Centers {
//  int _id;
//  String _nameEn;
//  String _nameAr;
//  double _lat;
//  double _lng;
//  List<int> _states;
//
//  Centers(
//      {int id,
//      String nameEn,
//      String nameAr,
//      double lat,
//      double lng,
//      List<int> states}) {
//    this._id = id;
//    this._nameEn = nameEn;
//    this._nameAr = nameAr;
//    this._lat = lat;
//    this._lng = lng;
//    this._states = states;
//  }
//
//  int get id => _id;
//
//  set id(int id) => _id = id;
//
//  String get nameEn => _nameEn;
//
//  set nameEn(String nameEn) => _nameEn = nameEn;
//
//  String get nameAr => _nameAr;
//
//  set nameAr(String nameAr) => _nameAr = nameAr;
//
//  double get lat => _lat;
//
//  set lat(double lat) => _lat = lat;
//
//  double get lng => _lng;
//
//  set lng(double lng) => _lng = lng;
//
//  List<int> get states => _states;
//
//  set states(List<int> states) => _states = states;
//
//  Centers.fromJson(Map<String, dynamic> json) {
//    _id = json['id'];
//    _nameEn = json['nameEn'];
//    _nameAr = json['nameAr'];
//    _lat = json['lat'];
//    _lng = json['lng'];
//    _states = json['states'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this._id;
//    data['nameEn'] = this._nameEn;
//    data['nameAr'] = this._nameAr;
//    data['lat'] = this._lat;
//    data['lng'] = this._lng;
//    data['states'] = this._states;
//    return data;
//  }
//}
