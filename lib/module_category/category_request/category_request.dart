class CategoryRequest{

  String? menuId;
  String? deviceKind;
  String? fullName;

  CategoryRequest({this.menuId, this.deviceKind, this.fullName});

  Map<String, String> toJson() {
    return {
      'menuId': '605c9e18a6069d09ae005024',
      'deviceKind': 'android',
      'fullName':'PostIAssignmentR'
    };
  }
}