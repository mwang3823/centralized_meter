class SharedUploadResModel {
  String? fileUrl;
  String? fileName;

  SharedUploadResModel({this.fileUrl, this.fileName});

  SharedUploadResModel.fromJson(Map<String, dynamic> json) {
    fileUrl = json['file_url'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_url'] = this.fileUrl;
    data['file_name'] = this.fileName;
    return data;
  }
}
