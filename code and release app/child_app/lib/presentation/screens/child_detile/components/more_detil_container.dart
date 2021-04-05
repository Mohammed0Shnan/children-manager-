import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:child_app/util/size_config.dart';

class MoreDetileContainer extends StatelessWidget {
 final String description;

  const MoreDetileContainer({Key key, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blueAccent, shape: BoxShape.circle),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Material(
                elevation: 20,
                color: Colors.blueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                           SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text('الوصف',style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                            ),),
                          ),
                          Text(description,style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,fontWeight: FontWeight.bold,
                             
                            ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
