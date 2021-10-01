import 'package:injectable/injectable.dart';
import 'package:rightware/module_category/category_request/category_request.dart';
import 'package:rightware/module_category/manager/category_manager.dart';
import 'package:rightware/module_category/response/category_response.dart';

@injectable
class CategoryService {
  final  CategoryManager _categoryManager;

  CategoryService(this._categoryManager);

  Future<Categories?> getCategories(CategoryRequest request)  {
    return _categoryManager.getCategories(request);
  }
}