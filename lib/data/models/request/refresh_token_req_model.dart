class RefreshTokenReqModel {
  final String? refreshToken;

  RefreshTokenReqModel({this.refreshToken});
  
  Map<String, dynamic> toJson() {
    return {'refresh_token': refreshToken};
  }
}
