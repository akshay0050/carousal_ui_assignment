class AlbumData {
  int _userId;
  int _id;
  String _title;
  String _url;

  AlbumData({int userId, int id, String title, String url}) {
    this._userId = userId;
    this._id = id;
    this._title = title;
    this._url = url;
  }

  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get url => _url;
  set url(String url) => _url = url;

  AlbumData.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'] ?? "https://en.wikipedia.org/wiki/Lorem_ipsum";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['url'] = this._url;
    return data;
  }
}
