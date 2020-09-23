import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Contact",
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  @override
  MyappState createState() => MyappState();
}

class MyappState extends State<Myapp> {
  // Nama
  TextEditingController controllernama = new TextEditingController();

  // Nomer Telepon
  TextEditingController controllernum = new TextEditingController();

  // Email
  TextEditingController controlleremail = new TextEditingController();

  //
  TextEditingController controlleralamat = new TextEditingController();

  // City
  TextEditingController controllercity = new TextEditingController();

  // Zip
  TextEditingController controllerzip = new TextEditingController();

  String materi;

  String area;

  String state;

  String all = '';

  List listMateri = ["Flutter", "Laravel", "React JS"];
  List listarea = ["+62", "+60", "+1", "+99", "+34"];
  List liststate = ["Indonesia", "Amerika", "Malaysia", "Japan", "Italia"];

  void kirimData() {

    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 310.0,
        child: Column(
          children: [
            Text("Fullname : ${controllernama.text}"),
            Text("Phone : ${area}${controllernum.text}"),
            Text("Address : ${controlleralamat.text}"),
            Text("City : ${controllercity.text}"),
            Text("Zip : ${controllerzip.text}"),
            Text("Email : ${controlleremail.text}"),
            Text("State : ${state}"),
            Text(all),
            RaisedButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
    if (_autoValidate == true && _formKey.currentState.validate() || _formKey.currentState.validate()) {
      kirimData();
    }
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Field name is required';
    else
      return null;
  }

  String validateNumber(String value) {
    if (value.length != 10)
      return 'Field phone number is required';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Fill in a valid email';
    else
      return null;
  }


  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6c5ce7),
        title: Text("Contact"),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.more_vert
                ),
              )
          ),
        ],

      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: ListView(

              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: validateName,
                    controller: controllernama,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      labelText: "Nama Lengkap",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0))),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 150,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[100],
                                  borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text("Area"),
                                    value: area,
                                    items: listarea.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        area = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              
                              Container(
                                width: 330,
                                child: TextFormField(
                                  validator: validateNumber,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blueGrey[100],
                                    labelText: "Phone",
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0))),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered

                                ),
                              ),
                            ]
                        ),

                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: controlleralamat,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      labelText: "Address",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0))),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: controllercity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      labelText: "City",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0))),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 150,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[100],
                                  borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text("State"),
                                    value: state,
                                    items: liststate.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        state = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: TextFormField(
                                  controller: controllerzip,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blueGrey[100],
                                    labelText: "Zip",
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0))),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered

                                ),
                              ),
                            ]
                        ),

                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: validateEmail,
                    controller: controlleremail,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      labelText: "Email",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(topRight : Radius.circular(5.0),topLeft : Radius.circular(5.0))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purpleAccent,
                  onPressed: () {
                    _validateInputs();
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}
