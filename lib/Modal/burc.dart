
class Burc {
  String _burcName;
  String _burcDate;
  String _burcDetail;
  String _burcSmallPicture;
  String _burcLargePicture;

  Burc(this._burcName, this._burcDate, this._burcDetail, this._burcSmallPicture,
      this._burcLargePicture);

  String get burcLargePicture => _burcLargePicture;

  set burcLargePicture(String value) {
    _burcLargePicture = value;
  }

  String get burcSmallPicture => _burcSmallPicture;

  set burcSmallPicture(String value) {
    _burcSmallPicture = value;
  }

  String get burcDetail => _burcDetail;

  set burcDetail(String value) {
    _burcDetail = value;
  }

  String get burcDate => _burcDate;

  set burcDate(String value) {
    _burcDate = value;
  }

  String get burcName => _burcName;

  set burcName(String value) {
    _burcName = value;
  }
}