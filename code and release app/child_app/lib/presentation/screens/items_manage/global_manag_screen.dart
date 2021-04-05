import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/child_bloc.dart';
import 'package:child_app/business_logic/blocs/item_bloc.dart';
import 'package:child_app/business_logic/blocs/wait_done_bloc.dart';
import 'package:child_app/presentation/screens/items_manage/components/body.dart';

class GlobalManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ادارة عامة",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder<WaitDone>(
              stream: waitDoneBloC.stream,
              initialData: waitDoneBloC.defaultState(),
              builder: (context, AsyncSnapshot<WaitDone> snapshot) {
                switch (snapshot.data) {
                  case WaitDone.Wait:
                    {
                      return Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      );
                    }
                  case WaitDone.Done:
                    {
                      return IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          waitDoneBloC.toggleToWait();
                         itemBloC.getItems();
                        },
                      );
                    }
                }
              },
            )
          ],
        ),
        backgroundColor: Colors.purple[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.purple[900],
        onPressed: () {
          Navigator.pushNamed(context, '/add_item');
        },
      ),
    );
  }
}
