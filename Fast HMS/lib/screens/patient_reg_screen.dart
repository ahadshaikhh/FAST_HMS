import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() => _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  String? dialog_msg;
  final _formKey = GlobalKey<FormState>();
  late String? s1, s2, s3, password, password1;
  late int i1,i2;

  Future<void> submitPatientInfo() async {
    try {
      AuthResponse response_for_signup = await Supabase.instance.client.auth
          .signUp(email: s2, password: password1.toString());
    }catch(error) {
      dialog_msg =  'Patient with this Email already exist';
      // print(error);
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;
      final res = await Supabase.instance.client.from('Patient').insert({
        'name': s1,
        'age': i1,
        'phone': i2,
        'email': s2,
        'gender': s3,
        'password':password1,
        'p_id': user?.id,
      });
    dialog_msg = 'Patient Registered Successfully';
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'REGISTRATION',
            style: TextStyle(
              fontFamily: 'Assistant',
            ),
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Name: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (name) {
                          if (name == '') {
                            return 'Enter a Name!';
                          } else {
                            s1 = name;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Age: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (age) {
                          if (age.toString() == '') {
                            return 'Enter a valid age';
                          } else {
                            i1 = int.parse(age.toString());
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Phone Number: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (phone_no) {
                          if (phone_no.toString().length != 11) {
                            return 'Enter 11 digit phone no';
                          } else {
                            i2 = int.parse(phone_no.toString());
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (email) {
                          if (!EmailValidator.validate(email.toString())) {
                            return 'Enter a valid Email';
                          } else {
                            s2 = email;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Gender (M/F): ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (gender) {
                          if (gender != 'M' && gender != 'F') {
                            return 'Enter M for Male, F for Female';
                          } else {
                            s3 = gender;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (pass) {
                          if (pass.toString().length < 6 ) {
                            return 'Password can not be shorter than 6 characters ';
                          } else {
                            password = pass;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Confirm Password: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (pass) {
                          if (pass == '') {
                            return 'Enter a Password';
                          } else if (pass != password) {
                            return 'Passwords do not match';
                          } else {
                            password1 = pass;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()){
                              await submitPatientInfo();
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        backgroundColor:
                                        Color.fromARGB(255, 17, 23, 56),
                                        title: Text(
                                          dialog_msg.toString(),
                                          style:
                                          TextStyle(color: Colors.white),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              if(dialog_msg=='Patient with this Email already exist'){
                                                Navigator.pop(context);
                                              }else if(dialog_msg =='Patient Registered Successfully'){
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ));

                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 35, 37, 64),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black),
                                  ))),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontFamily: 'Assistant',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )),

                      // Add TextFormFields and ElevatedButton here.
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}