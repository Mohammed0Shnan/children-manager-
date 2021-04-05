import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/child_crud_bloc.dart';
import 'package:child_app/data/models/child.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/data/repositories/child_repository.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:child_app/presentation/widgets/rounded_button.dart';
import 'package:child_app/presentation/widgets/rounded_input_feild.dart';
import 'package:child_app/presentation/widgets/succes_widget.dart';
import 'package:child_app/util/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _name;

  DateTime _date;

  String _gender;

  bool active = false;
  final ChildCrudBloC childCrudBloC = ChildCrudBloC();
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                RoundedInputFeild(
                  hintText: 'ادخل الاسم',
                  icon: Icons.person,
                  isSecure: false,
                  valueChanged: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(30)),
                  width: SizeConfig.screenWidth * 0.8,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<String>(
                          value: 'male',
                          activeColor: Colors.blueAccent,
                          onChanged: (v) {
                            setState(() {
                              _gender = v;
                            });
                          },
                          title: Text('ذكر'),
                          groupValue: _gender,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          activeColor: Colors.blueAccent,
                          value: 'female',
                          onChanged: (v) {
                            setState(() {
                              _gender = v;
                            });
                          },
                          title: Text('انثى'),
                          groupValue: _gender,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton.icon(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate:
                                  (_date == null) ? DateTime.now() : _date,
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now())
                          .then((date) {
                        setState(() {
                          _date = date;
                        });
                      });
                    },
                    icon: Icon(
                      Icons.date_range,
                      size: 28,
                    ),
                    label: Text(
                      'تاريخ الميلاد',
                      style: style,
                    )),
                SizedBox(
                  height: 40,
                ),
                RoundedButton(
                  text: 'اضافة',
                  onPress: () {
                    setState(() {
                      active = !active;
                    });
                    childCrudBloC.addChild(Child(
                        name: 'new name',
                        points: 0.0,
                        gender: 'male',
                        dob: DateTime.now()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<ChildResponse>(
                  stream: childCrudBloC.subject.stream,
                  builder: (context, AsyncSnapshot<ChildResponse> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return buildErrorWidget(context, error: '');
                      } else {
                        return buildSuccesWidget(
                          message: 'Successfuly !!!',
                        );
                      }
                    } else if (snapshot.hasError) {
                      return buildErrorWidget(context, error: '');
                    } else if (snapshot.connectionState ==
                            ConnectionState.waiting &&
                        active == true) {
                      return buildLoadingWidget();
                    } else {
                      return SizedBox(
                        height: 10,
                        width: 10,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
