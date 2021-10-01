import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rightware/module_category/category_request/category_request.dart';
import 'package:rightware/module_category/service/category_serivce.dart';
import 'package:rightware/module_category/ui/screen/category_screen.dart';
import 'package:rightware/module_category/ui/state/categories_empty_state.dart';
import 'package:rightware/module_category/ui/state/categories_error_state.dart';
import 'package:rightware/module_category/ui/state/categories_loading_state.dart';
import 'package:rightware/module_category/ui/state/categories_state.dart';
import 'package:rightware/module_category/ui/state/categories_successfully_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rightware/generated/l10n.dart';

@injectable
class CategoriesStateManager {
  final CategoryService _categoryService;
  final PublishSubject<CategoriesState> _stateSubject =
  PublishSubject<CategoriesState>();

  Stream<CategoriesState> get stateStream => _stateSubject.stream;

  CategoriesStateManager(
      this._categoryService);

  StreamSubscription? newActionSubscription;

  void getCategories(CategoriesScreenState screenState) {
      _stateSubject.add(CategoriesLoadingState(screenState));
      CategoryRequest request = CategoryRequest();
      _categoryService.getCategories(request).then((value) {
        if (value == null) {
          _stateSubject.add(CategoriesErrorState(
              screenState,S.current.errorHappened));
        } else if (value.result.isEmpty) {
          _stateSubject
              .add(CategoryEmptyState(screenState, S.current.homeDataEmpty));
        } else {
          _stateSubject.add(CategoriesLoadedState(screenState, value.result));
        }
      });
  }

}
