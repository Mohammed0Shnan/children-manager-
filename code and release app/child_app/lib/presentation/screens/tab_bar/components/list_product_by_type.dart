// import 'package:flutter/material.dart';
// import 'package:pro/business_logic/blocs/products_by_type.dart';
// import 'package:pro/data/models/product_response.dart';
// import 'package:pro/presentation/screens/tab_bar/components/list_product.dart';
// import 'package:pro/presentation/widgets/error_widget.dart';
// import 'package:pro/presentation/widgets/loading_widget.dart';


// class LIstProductByType extends StatelessWidget {
//   final int type;
//   LIstProductByType({this.type}) {
//     productByTypeBloc.getProducts(type);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ProductResponse>(
//         stream: productByTypeBloc.behaviorSubject.stream,
//         builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data.error != null && snapshot.data.error.length > 0) {
//               return buildErrorWidget(error: 'error in data fetching ');
//             } else {
//               return buildProductsByType(snapshot.data.products);
//             }
//           } else if (snapshot.hasError) {
//             return buildErrorWidget(error: 'error in data fetching ');
//           } else {
//             return buildLoadingWidget();
//           }
//         });
//   }


// }
