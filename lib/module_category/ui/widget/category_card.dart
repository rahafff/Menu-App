import 'package:flutter/material.dart';
import 'package:rightware/module_category/response/category_response.dart';
import 'package:rightware/utils/components/progresive_image.dart';
import 'package:rightware/utils/text_style/text_style.dart';

class CategoryCard extends StatelessWidget {
  final Item item;
  const CategoryCard({ required this.item});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8.0,
        borderOnForeground: false,
        child: ExpansionTile(
          title:  Text(item.itemName!.en ??'',style: StyleText.categoryStyle,),
          leading: CustomNetworkImage(
                width: 75,
                height: 75,
                imageSource: item.photo??'',
                assets: ''.contains('assets/'),
              ),
          subtitle: Row(children: [
            Text(item.price!.amount.toString()),
            SizedBox(width: 5,),
            Text(item.price!.currency.toString()),
          ],),
          children:
          List<Widget>.generate(item.option!.length, (int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(item.option![index].en ??''),
                  Row(
                    children: [
                      Text(item.option![index].price!.amount.toString()),
                      SizedBox(width: 5,),
                      Text(item.option![index].price!.currency.toString()),
                    ],
                  ),
                ],
              ),
            );
          }),

        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     CustomNetworkImage(
        //       width: 75,
        //       height: 75,
        //       imageSource: item.photo??'',
        //       assets: ''.contains('assets/'),
        //     ),
        //     Expanded(
        //       child: Column(
        //         children: [
        //           Text(item.itemName!.en ??''),
        //           ListView.builder(itemBuilder: (context ,index){
        //             return Text(item.option![index].en ??'');
        //           },
        //             itemCount: item.option!.length,
        //             shrinkWrap: true,
        //             physics: NeverScrollableScrollPhysics(),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Row(children: [
        //       Text(item.price!.amount.toString() ),
        //       Text(item.price!.currency.toString() ),
        //     ],)
        //     // Column(
        //     //   crossAxisAlignment: CrossAxisAlignment.start,
        //     //   children: [
        //     //     Text(item.itemName!.en??''),
        //     //     Text(item.price!.amount.toString()),
        //     //   ],
        //     // )
        //     // Align(
        //     //   alignment: Alignment.bottomCenter,
        //     //   child: Container(
        //     //     height: 35,
        //     //     width: 1000,
        //     //     decoration: BoxDecoration(
        //     //       gradient: LinearGradient(
        //     //           begin: Alignment.topCenter,
        //     //           end: Alignment.bottomCenter,
        //     //           colors: [
        //     //             Colors.black.withOpacity(0.00),
        //     //             Colors.black.withOpacity(0.05),
        //     //             Colors.black.withOpacity(0.3),
        //     //             Colors.black.withOpacity(0.3),
        //     //             Colors.black.withOpacity(0.3),
        //     //           ]),
        //     //     ),
        //     //     child: Center(
        //     //         child: Text(
        //     //           item.itemName!.en??'',
        //     //           style: TextStyle(
        //     //               color: Colors.black, fontWeight: FontWeight.w600),
        //     //         )),
        //     //   ),
        //     // )
        //   ],
        // ),
      ),
    );
  }
}