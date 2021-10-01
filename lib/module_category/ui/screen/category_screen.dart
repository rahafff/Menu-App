import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rightware/module_category/state_manager/category_state_manager.dart';
import 'package:rightware/module_category/ui/state/categories_loading_state.dart';
import 'package:rightware/module_category/ui/state/categories_state.dart';

@injectable
class CategoriesScreen extends StatefulWidget {
  final CategoriesStateManager _stateManager;

  CategoriesScreen(this._stateManager);

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  late CategoriesState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  Future <void> getCategories() async {
    widget._stateManager.getCategories(this);
  }

  @override
  void initState() {
    currentState = CategoriesLoadingState(this);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget._stateManager.getCategories(this);
    });
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
        // body: TabBarView(children: [
        //   Icon(Icons.apps),
        //   Icon(Icons.movie),
        //   Icon(Icons.games),
        // ]),
    ));
  }

  @override
  void dispose(){
    widget._stateManager.newActionSubscription?.cancel();
    super.dispose();
  }
}