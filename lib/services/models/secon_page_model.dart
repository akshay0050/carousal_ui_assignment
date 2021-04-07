class SecondPageModel {
  String _title;
  String _description;
  List<Points> _points;

  SecondPageModel({String title, String description, List<Points> points}) {
    this._title = title;
    this._description = description;
    this._points = points;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  List<Points> get points => _points;
  set points(List<Points> points) => _points = points;

  SecondPageModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _description = json['description'];
    if (json['points'] != null) {
      _points = new List<Points>();
      json['points'].forEach((v) {
        _points.add(new Points.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['description'] = this._description;
    if (this._points != null) {
      data['points'] = this._points.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Points {
  String _image;
  List<String> _subpoints;

  Points({String image, List<String> subpoints}) {
    this._image = image;
    this._subpoints = subpoints;
  }

  String get image => _image;
  set image(String image) => _image = image;
  List<String> get subpoints => _subpoints;
  set subpoints(List<String> subpoints) => _subpoints = subpoints;

  Points.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _subpoints = json['subpoints'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['subpoints'] = this._subpoints;
    return data;
  }
}
