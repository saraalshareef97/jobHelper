import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_helper/screens/errorSearching.dart';
import 'package:job_helper/screens/searchResult.dart';
import 'package:job_helper/utils/contants.dart';
import 'package:job_helper/widgets/CustomClipper.dart';

class FirstPartHomeScreen extends StatefulWidget {
  final String valueSelected;

  FirstPartHomeScreen({Key key, @required this.valueSelected})
      : super(key: key);
  @override
  FirstPartHomeScreenState createState() => FirstPartHomeScreenState();
}

class FirstPartHomeScreenState extends State<FirstPartHomeScreen> {
  String valueSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
              color: primaryBlue,
              height: MediaQuery.of(context).size.height / 1.5,
              padding: EdgeInsets.only(top: 70),
              child: Column(children: <Widget>[
                Center(
                  child: Text(
                    'Are you tired searching for jobs?\n We are here for you! \n we will let you check out all the available jobs opportunites! ',
                    textAlign: TextAlign.center,
                    style: welcomeWidget,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                    child: Text(
                      'Choose the job provider you would like to find a job from: ',
                      style: smallTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(),
                            dropdownColor: white,
                            items: [
                              DropdownMenuItem<String>(
                                child: Text(
                                  providers[0],
                                  style: dropDownLabelStyle,
                                ),
                                value: 'zero',
                              ),
                              DropdownMenuItem<String>(
                                child: Text(
                                  providers[1],
                                  style: dropDownLabelStyle,
                                ),
                                value: 'one',
                              )
                            ],
                            onChanged: (String value) {
                              setState(() {
                                valueSelected = value;
                              });
                            },
                            hint: Text(
                              'Job Providers',
                              style: smallTextStyle,
                            ),
                            value: valueSelected,
                          ),
                        ))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'See Results',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                        // After Press this button you will navigate to the resutl page or error page
                        // based on what you had choosen from dropDown menu
                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            if (valueSelected == 'zero' ||
                                valueSelected == 'one') {
                              return SearchResult(value: valueSelected);
                            } else
                              return ErrorPage();
                          }));
                        }))
              ])))
    ]);
  }
}
