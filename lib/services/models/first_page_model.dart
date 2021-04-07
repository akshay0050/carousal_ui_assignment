class FirstPageModel {
  String _title;
  String _subtitle1;
  String _subtitle2;
  String _image;
  String _pageTitle;
  List<Pages> _pages;

  FirstPageModel(
      {String title,
        String subtitle1,
        String subtitle2,
        String image,
        String pageTitle,
        List<Pages> pages}) {
    this._title = title;
    this._subtitle1 = subtitle1;
    this._subtitle2 = subtitle2;
    this._image = image;
    this._pageTitle = pageTitle;
    this._pages = pages;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get subtitle1 => _subtitle1;
  set subtitle1(String subtitle1) => _subtitle1 = subtitle1;
  String get subtitle2 => _subtitle2;
  set subtitle2(String subtitle2) => _subtitle2 = subtitle2;
  String get image => _image;
  set image(String image) => _image = image;
  String get pageTitle => _pageTitle;
  set pageTitle(String pageTitle) => _pageTitle = pageTitle;
  List<Pages> get pages => _pages;
  set pages(List<Pages> pages) => _pages = pages;

  FirstPageModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _subtitle1 = json['subtitle1'];
    _subtitle2 = json['subtitle2'];
    _image = json['image'];
    _pageTitle = json['page_title'];
    if (json['pages'] != null) {
      _pages = new List<Pages>();
      json['pages'].forEach((v) {
        _pages.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['subtitle1'] = this._subtitle1;
    data['subtitle2'] = this._subtitle2;
    data['image'] = this._image;
    data['page_title'] = this._pageTitle;
    if (this._pages != null) {
      data['pages'] = this._pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  String _image;
  String _title;
  String _description;
  String _subtitle;

  Pages({String image, String title, String description, String subtitle}) {
    this._image = image;
    this._title = title;
    this._description = description;
    this._subtitle = subtitle;
  }

  String get image => _image;
  set image(String image) => _image = image;
  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  String get subtitle => _subtitle;
  set subtitle(String subtitle) => _subtitle = subtitle;

  Pages.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _title = json['title'];
    _description = json['description'];
    _subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['title'] = this._title;
    data['description'] = this._description;
    data['subtitle'] = this._subtitle;
    return data;
  }
}
