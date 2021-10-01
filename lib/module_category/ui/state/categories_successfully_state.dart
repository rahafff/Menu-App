import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rightware/generated/l10n.dart';
import 'package:rightware/module_category/response/category_response.dart';
import 'package:rightware/module_category/ui/screen/category_screen.dart';
import 'package:rightware/module_category/ui/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:rightware/utils/images/images.dart';

import 'categories_state.dart';

class CategoriesLoadedState extends CategoriesState {
  CategoriesScreenState screenState;
  List<Result> categories;
  CategoriesLoadedState(this.screenState, this.categories) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.brown.shade50,
        child: Column(
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(ImageAsset.REST),
                        fit: BoxFit.cover,
                      )),
                )),
            Expanded(
                child: Container(
                 child: DefaultTabController(
                length: categories.length,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 25,end: 25,top: 10),
                        child: ButtonsTabBar(
                          radius: 20,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                               Colors.orange.shade900,
                                Colors.orange.shade700,
                                Colors.orange.shade500,

                              ],
                            ),
                          ),
                          unselectedLabelStyle: TextStyle(color: Colors.black),
                          unselectedBackgroundColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          height: 40,
                          tabs: List<Widget>.generate(categories.length, (int index) {
                            return Tab(text: categories[index].categoryName.en);
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children:
                            List<Widget>.generate(categories.length, (int index) {
                          return ListView.builder(
                            itemBuilder: (context, n) {
                              return CategoryCard(
                                item: categories[index].item[n],
                              );
                            },
                            itemCount: categories[index].item.length,
                            shrinkWrap: true,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  // List<Widget> getOrders(List<OrderModel> orders) {
  //   if (orders.isEmpty) return [];
  //   List <OrderCard> ordersCard = [];
  //   orders.forEach((element) {
  //     ordersCard.add(OrderCard(
  //       orderId: element.orderId,
  //       orderCost: element.orderCost.toString(),
  //       orderStatus: element.orderStatus,
  //       orderDate:element.orderDate,
  //     ));
  //   });
  //   return ordersCard;
  // }
}
