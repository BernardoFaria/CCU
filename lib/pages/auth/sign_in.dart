import 'package:flutter/material.dart';
import 'package:trainsafe/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trainsafe/shared/constants.dart';

import '../loading.dart';
import '../loading2.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading2() : Container(

        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/back11.jpg"),
        alignment: Alignment.centerRight,
        fit: BoxFit.cover,
      ),
    ),

    child: Scaffold(
    backgroundColor: Colors.transparent,

    appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,

        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, size: 30,),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child:SingleChildScrollView(


            child: Column(
               children: <Widget>[
                 SizedBox(
                     height: 300,
                     child: Image.asset('assets/images/trainsafe.png')),

                 SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.4)

                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.4)

                ),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.orange[400].withOpacity(0.9),
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() {
                          loading = false;
                          error = 'Could not sign in with those credentials';
                        });
                      }
                    }
                  }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                 shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),

                  color: Colors.orange[400].withOpacity(0.9),
                  child: Text(
                    'Log In Anonymously',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      setState(() => loading = true);
                      print('error signing in');
                    } else {
                      print('signed in');
                      print(result.uid);
                    }
                  },
              ),

              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
      ),
    ),
    );
  }
}