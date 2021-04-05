import 'package:child_app/business_logic/blocs/behavior_bloc.dart';
import 'package:child_app/data/models/behavior.dart';
import 'package:child_app/data/models/behavior_response.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/home/components/detile_container.dart';
import 'components/home_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  void initState() { 
 
    behaviorBloC.getBehaviours();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: DetileContainer(),
          ),
          Expanded(
            child: StreamBuilder<BehaviorResponse>(
              stream: behaviorBloC.subject.stream,
              builder: (context, AsyncSnapshot<BehaviorResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    //Error in server
                    buildErrorWidget(context, error: 'Error in data fetching');
                  } else {
                    return buildListOfBehavior(
                        context, snapshot.data.behaviours);
                  }
                } else if (snapshot.hasError) {
                  // Error in connection
                  buildErrorWidget(context, error: 'Error in data fetching');
                } else {
                  return buildLoadingWidget();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListOfBehavior(BuildContext context, List<Behavior> behaviors) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10, right: 10, top: 25),
      child: ListView.separated(
        padding: EdgeInsets.only(left:10),
        separatorBuilder: (context ,index){
          return SizedBox(height: 10,);
        },
          scrollDirection: Axis.vertical,
          itemCount: behaviors.length,
          itemBuilder: (context, index) {
            return HomeCard(
              title: behaviors[index].name,
              subTitle: behaviors[index].typeName,
              color: Colors.blue[800],
              degree: behaviors[index].point,
            );
          }),
    );
  }
}
