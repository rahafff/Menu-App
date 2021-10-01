import 'package:flutter/material.dart';
import 'package:rightware/module_category/ui/screen/category_screen.dart';

abstract class CategoriesState {
  final CategoriesScreenState categoriesScreenState;

  CategoriesState(this.categoriesScreenState);

  Widget getUI(BuildContext context);
}
