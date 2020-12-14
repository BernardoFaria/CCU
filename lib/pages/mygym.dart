import 'package:flutter/material.dart';

class MyGym extends StatefulWidget {
  @override
  _MyGymState createState() => _MyGymState();
}

class _MyGymState extends State<MyGym> {

  IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Image.asset('assets/images/qrcode.png',
                width: 250, height: 250, fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back11.jpg"),
          alignment: Alignment.centerRight,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: 370,
            height: 650,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text('MyGym',
                        style: TextStyle(fontSize: 50,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold)
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300.0,
                    height: 80.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.grey.withOpacity(0))
                      ),
                      color: Colors.grey.withOpacity(0.3),
                      onPressed: () => showAlert(context),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('QR Code',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 300.0,
                    height: 80.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.withOpacity(0))
                      ),
                      color: Colors.grey.withOpacity(0.3),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/training_plan');
                      },
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Training Plan',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Text('Sessions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/video');
                          },
                          child: Container(
                            width: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/session1.png"),
                                alignment: Alignment.centerRight,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // color: Colors.red,
                          ),
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session2.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session3.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session4.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session5.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session6.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session7.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session8.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session9.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/session10.png"),
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: 300.0,
                  //   height: 60.0,
                  //   child: RaisedButton(
                  //     color: Colors.grey.withOpacity(0.3),
                  //     onPressed: () {
                  //       //TODO
                  //     },
                  //     padding: EdgeInsets.all(10.0),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: <Widget>[
                  //         Text('SESSIONS',
                  //           style: TextStyle(
                  //             // fontFamily: 'Spinnaker-Regular',
                  //               fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black.withOpacity(1.0),

          child: Row(
            children: [
              Spacer(),
              IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              }),
              Spacer(flex: 200),
              IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),

            ],
          ),
        ),

      ),
    );
  }
}
