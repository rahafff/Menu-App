import 'package:flutter/material.dart';
import 'package:rightware/module_category/ui/screen/category_screen.dart';

import 'categories_state.dart';

class CategoriesLoadingState extends CategoriesState {
  CategoriesLoadingState(CategoriesScreenState screenState) : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}