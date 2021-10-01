import 'package:injectable/injectable.dart';
import 'package:rightware/consts/urls.dart';
import 'package:rightware/module_category/category_request/category_request.dart';
import 'package:rightware/module_category/response/category_response.dart';
import 'package:rightware/module_network/http_client/http_client.dart';

@injectable
class CategoryRepository {
  final ApiClient _apiClient;
  CategoryRepository(this._apiClient);

  Future<Categories?> getCategory(CategoryRequest request) async {
    dynamic response = await _apiClient.get(Urls.CATEGORY,queryParams: request.toJson()
        ,headers: {'secretKey': 'TsTForBLiveOoOo'});
    if (response == null) return null;
    return Categories.fromJson(response);
  }
}