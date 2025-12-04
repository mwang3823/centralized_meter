class CheckVersionResModel {
  int? isUpdate;
  String? version;
  String? releaseDate;
  String? link;
  bool? isReview;

  CheckVersionResModel(
      {this.isUpdate,
        this.version,
        this.releaseDate,
        this.link,
        this.isReview});

  CheckVersionResModel.fromJson(Map<String, dynamic> json) {
    isUpdate = json['is_update'];
    version = json['version'];
    releaseDate = json['release_date'];
    link = json['link'];
    isReview = json['is_review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_update'] = this.isUpdate;
    data['version'] = this.version;
    data['release_date'] = this.releaseDate;
    data['link'] = this.link;
    data['is_review'] = this.isReview;
    return data;
  }
}