import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/child_bloc.dart';
import 'package:child_app/business_logic/blocs/wait_done_bloc.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/presentation/screens/childs/components/list_of_children.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';


class Body extends StatelessWidget {
  Body(){
  childBloC.getChildren();
  }
  @override
  Widget build(BuildContext context) {
  
    return StreamBuilder<ChildResponse>(
      stream: childBloC.subject.stream,
       builder: (context, AsyncSnapshot<ChildResponse> snapshot) {  
          if(snapshot.hasData){
            if(snapshot.data.error != null && snapshot.data.error.length>0){  //Error in server
                 buildErrorWidget(context , error:'Error in data fetching');
            }else{
              waitDoneBloC.toggleToDone();
              return buildListOfChildren(context , snapshot.data.childs);
            }
          }else if(snapshot.hasError){    // Error in connection
             buildErrorWidget(context , error:'Error in data fetching');
          }else{
            return buildLoadingWidget();
          }
       },
    );
  }

}