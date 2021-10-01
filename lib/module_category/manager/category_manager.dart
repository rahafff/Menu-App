import 'package:injectable/injectable.dart';
import 'package:rightware/module_category/category_request/category_request.dart';
import 'package:rightware/module_category/repository/category_repository.dart';
import 'package:rightware/module_category/response/category_response.dart';

@injectable
class CategoryManager {
  final CategoryRepository _categoryRepository;

  CategoryManager(this._categoryRepository);

  Future <Categories?> getCategories(CategoryRequest request) => _categoryRepository.getCategory(request);
}