
import 'package:child_app/business_logic/blocs/behavior_bloc.dart';
import 'package:child_app/data/models/behavior.dart';
import 'package:child_app/data/models/behavior_response.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/statistics/components/ingrediant_progress.dart';
import 'package:child_app/util/size_config.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class PublicStatistics extends StatelessWidget {
  PublicStatistics(){

  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BehaviorResponse>(
        stream: behaviorBloC.subject.stream,
        builder: (context, AsyncSnapshot<BehaviorResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              //Error in server
              buildErrorWidget(context, error: 'Error in data fetching');
            } else {
             
              return buildStatisticsContent(context, snapshot.data.behaviours);
            }
          } else if (snapshot.hasError) {
            // Error in connection
            buildErrorWidget(context, error: 'Error in data fetching');
          } else {
            return buildLoadingWidget();
          }
        });
  }
}

Widget buildStatisticsContent(context, List<Behavior> behaviours) {
 
   List<Color> colors = [Colors.red,Colors.yellow,Colors.purple,Colors.blue,Colors.green,Colors.deepOrange,Colors.lightGreen,Colors.teal];
  return Container(
    width: SizeConfig.screenWidth,
    height: SizeConfig.screenHeight,
    padding: EdgeInsets.all(10),
    color: Colors.white,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          RadialProgress(
            colors:List.generate(behaviours.length, (index) => colors[index]).toList(),
            progresses:List.generate(behaviours.length, (index) => behaviours[index].point).toList(),
            height: SizeConfig.screenWidth * .55,
            width: SizeConfig.screenWidth * .55,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(behaviours.length, (index) => IngrediantProgress(
                    ingrediant: behaviours[index].name,
                    percentage: behaviours[index].point,
                    progressColor: colors[index],
                  )),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

class RadialProgress extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> colors;
  final List<double> progresses;
  const RadialProgress({
    Key key,
    this.height,
    this.width, this.colors, this.progresses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progresses:progresses,colors: colors),
      child: Container(
        height: height,
        width: width,
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  final List<double> progresses;
  final List<Color> colors;
  RadialPainter({this.colors, this.progresses});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double startAngle = 0;
    for (int i = 0; i < progresses.length; i++) {
      Paint paint = Paint()
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round
        ..color = colors[i];
      double relatedProgress = progresses[i] * 360;
      canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
          math.radians(startAngle), math.radians(relatedProgress), true, paint);
      startAngle = startAngle + relatedProgress;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
