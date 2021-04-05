// import 'package:flutter/material.dart';
// import 'package:pro/business_logic/blocs/products_bloc.dart';
// import 'package:pro/data/models/product_response.dart';
// import 'package:pro/presentation/screens/tab_bar/components/products_header.dart';
// import 'package:pro/presentation/widgets/error_widget.dart';
// import 'package:pro/presentation/widgets/loading_widget.dart';


// class HomeHeader extends StatelessWidget {
//   HomeHeader() {
//     productBloc.getProducts();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ProductResponse>(
//         stream: productBloc.behaviorSubject.stream,
//         builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data.error != null && snapshot.data.error.length > 0) {
//               return buildErrorWidget(error: 'error in data fetching ');
//             } else {
//               return buildProductsHeader(snapshot.data.products);
//             }
//           } else if (snapshot.hasError) {
//             return buildErrorWidget(error: 'error in data fetching ');
//           } else {
//             return buildLoadingWidget();
//           }
//         });
//   }

 
// }
