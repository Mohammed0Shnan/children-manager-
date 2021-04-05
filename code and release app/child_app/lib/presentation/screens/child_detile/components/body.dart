import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/child_detile_bloc.dart';
import 'package:child_app/data/models/child.dart';
import 'package:child_app/data/models/child_detil.dart';
import 'package:child_app/data/models/child_detile_response.dart';
import 'package:child_app/presentation/screens/child_detile/components/child_detile_section.dart';
import 'package:child_app/presentation/screens/child_detile/components/detile_card.dart';
import 'package:child_app/presentation/screens/child_detile/components/sub_title_container.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:child_app/util/size_config.dart';

class Body extends StatelessWidget {
  final Child child;

  const Body({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChildDetileResponse>(
      stream: childDetilBloC.subject.stream,
      builder: (context, AsyncSnapshot<ChildDetileResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            //Error in server
            buildErrorWidget(context, error: 'Error in data fetching');
          } else {
            return buildBody(context, snapshot.data);
          }
        } else if (snapshot.hasError) {
          // Error in connection
          buildErrorWidget(context, error: 'Error in data fetching');
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget buildBody(BuildContext context, ChildDetileResponse detile) {
    ChildDetilModel data = detile.detiles;

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: child.id,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple.shade50,
                        width: 5,
                        style: BorderStyle.solid),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("asset/img/babyIcon.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              child.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ChildDetileSection(
                  gender: child.gender,
                  date: child.dob,
                  points: child.points,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.41,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: SubTitleContainer(title: 'سلوك الطفل'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: detile.detiles.behaviors.length,
                        itemBuilder: (context, index) {
                          return DetileCard(
                            name: data.behaviors[index].name,
                            type: data.behaviors[index].type,
                            typeName: data.behaviors[index].typeName,
                            points: data.behaviors[index].point,
                            description: data.behaviors[index].description,
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.41,
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerRight,
                      child: SubTitleContainer(
                        title: 'اهداف الطفل',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: detile.detiles.goals.length,
                        itemBuilder: (context, index) {
                          return DetileCard(
                            name: data.goals[index].name,
                            type: data.goals[index].type,
                            typeName: data.goals[index].typeName,
                            points: data.goals[index].point,
                            description: data.goals[index].description,
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.41,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: SubTitleContainer(
                      title: 'مهارات الطفل',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: detile.detiles.skills.length,
                        itemBuilder: (context, index) {
                          return DetileCard(
                            name: data.skills[index].name,
                            type: data.skills[index].type,
                            typeName: data.skills[index].typeName,
                            points: data.skills[index].point,
                            description: data.skills[index].description,
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
