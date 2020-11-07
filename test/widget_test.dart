import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _fnMobileNumber = FocusNode();
  final _fnEmailAddress = FocusNode();
  final _fnPassword = FocusNode();

  String _mobileNumber = '';
  String _emailAddress = '';
  String _password = '';
  
  processLoginCredentials() {
    if (_formKey.currentState.validate()) {
      //this ensures that onSaved callbacks get invoked
      _formKey.currentState.save();

      //connect with login api with credentials as input
      print('Mobile Number: $_mobileNumber');
      print('Email Address: $_emailAddress');
      print('Password: $_password');

      //received response is processed
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign-In'),
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        prefixIcon: Icon(Icons.smartphone),
                        prefixText: '+91-'),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    maxLengthEnforced: true,
                    focusNode: _fnMobileNumber,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your mobile no.';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    onSaved: (strValue) {
                      _mobileNumber = strValue;
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_fnEmailAddress);
                    },
                  ),
                  TextFormField(
                    //autofocus: true,
                    focusNode: _fnEmailAddress,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (strValue) {
                      if (strValue.isEmpty == true && strValue.length > 20)
                      {
                        return 'Please enter your email address';
                      }
                      else{
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(strValue);
                        if(emailValid == false){
                          return 'Please enter the correct email  address';
                        }
                      }
                      return null;
                    },
                    onSaved: (strValue) {
                      _emailAddress = strValue;
                    },
                    onFieldSubmitted: (strValue) {
                      FocusScope.of(context).requestFocus(_fnPassword);
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    focusNode: _fnPassword,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    validator: (strValue) {
                      if (strValue.isEmpty == true)
                        return 'Please enter your password';import 'package:flutter/material.dart';

class RegistrationSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        //   appBar: AppBar(
        //     title: Text(appTitle),
        //   ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FloatingActionButton(onPressed: null,
              backgroundColor: Colors.white,
              child : Icon(
                Icons.check,
                size: 40,
                color: Colors.black87,
  
              ),
             ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 30,
                  right: 40,
                  bottom: 20,
                ),
                child: Text(
                  "Your account is \n registered successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ButtonTheme(
                  minWidth: 270.0,
                  height: 50,
                  child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.pink,
                    child: Text(
                      'LOGIN',
                    ),
                    onPressed: () {
                      }
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

                      return null;
                    },
                    onSaved: (strValue) {
                      _password = strValue;
                    },
                    onFieldSubmitted: (strValue) {
                      processLoginCredentials();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: processLoginCredentials,
                      child: Text('LOGIN'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}