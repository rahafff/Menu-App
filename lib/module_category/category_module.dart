import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rightware/abstracts/module/yes_module.dart';
import 'package:rightware/module_category/category_routes.dart';
import 'package:rightware/module_category/ui/screen/category_screen.dart';
@injectable
class CategoryModule extends YesModule {
final CategoriesScreen _categoriesScreen;

CategoryModule(this._categoriesScreen,){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
     CategoryRoutes.CATEGORIES : (context) => _categoriesScreen,
    };
  }
}