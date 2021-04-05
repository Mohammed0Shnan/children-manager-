//  import 'package:flutter/material.dart';


// Container buildProductsHeader(List<Product> products) {
//     return Container(
//         height: 250,
//         width: double.infinity,
//         child: PageIndicatorContainer(
//           shape: IndicatorShape.circle(),
//           align: IndicatorAlign.bottom,
//           indicatorColor: Colors.yellow,
//           indicatorSelectorColor: Colors.red,
//           indicatorSpace: 5,
//           length:5,
//           padding: EdgeInsets.all(10),
//           child: PageView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: products.take(5).length,
//             itemBuilder: (context, index) {
//             return Stack(
//               children: <Widget>[
//            Container(
//               decoration: BoxDecoration(
//                    color:Colors.white,
//                 image: DecorationImage(
//                   image: AssetImage(products[index].img),
//                   fit: BoxFit.cover
//                 )
//               ),
          
           
//               ),
//               Container(
                
//                 decoration:BoxDecoration(
//                          gradient: LinearGradient(
//                   colors:[Colors.black12.withOpacity(0.3),Colors.black12.withOpacity(0.0)],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   stops: [0.0,0.5]
//                 ),
//                 )
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 0,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

//                   width: 150,
//                   child: Text(products[index].title,style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,

//                   ),),
//                 ),
//               )
//               ],
                        
//             );
//           }),
//         ));
//   }