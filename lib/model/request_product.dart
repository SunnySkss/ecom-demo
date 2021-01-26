class RequestClass {
  int categoryId;
  String deviceManufacturer;
  String deviceModel;
  String deviceToken;
  int pageIndex;
  RequestClass({this.categoryId,this.deviceManufacturer,this.deviceModel,this.deviceToken,this.pageIndex});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryId'] = this.categoryId;
    data['DeviceManufacturer'] = this.deviceManufacturer;
    data['DeviceModel'] = this.deviceModel;
    data['DeviceToken'] = this.deviceToken;
    data['PageIndex'] = this.pageIndex;
    return data;
  }
}