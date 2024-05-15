import 'package:flutter/material.dart';
import 'patient_reg_screen.dart';
import 'patient_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:email_validator/email_validator.dart';


class PatientBottomScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late String? pat_email;
  late String? pat_pass;

  // Future<bool> check_pass(String? pass) async {
  //   var data = await Supabase.instance.client.from('Patient').select('email,password').match({'email':pat_email, 'password':pass});
  //   if(data.isEmpty){
  //     //print(data.toString());
  //     print('User doesnt exist');
  //     return(false);
  //   }else{
  //     print('User exist');
  //     return(true);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    bool user_exist;
    openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 17, 23, 56),
          title: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            height: 260,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Email: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (email) {
                          if (!EmailValidator.validate(email.toString())) {
                            return 'Enter a valid Email';
                          } else {
                            pat_email = email;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Assistant',
                          color: Color.fromARGB(255, 99, 102, 147),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == '') {
                            return 'Enter password';
                          }
                          else{
                            pat_pass = value;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextButton(
                          onPressed: () async {
                            late var curr_pat;
                            var curr_pat_data;
                            if (_formKey.currentState!.validate()) {

                              curr_pat_data = await Supabase.instance.client.from('Patient').select('name,age,p_id,email,password').match({'email':pat_email, 'password':pat_pass});
                              if(curr_pat_data.isEmpty){
                                //print(data.toString());
                                //print('User dont exist');
                                user_exist = false;
                              }else{
                                try{
                                  var res = await Supabase.instance.client.auth.signInWithPassword(email: pat_email, password: pat_pass.toString());
                                  curr_pat = await Supabase.instance.client.auth.currentUser;
                                  print(curr_pat_data[0]['name']);
                                }catch(error){
                                  //print(error);
                                }
                                user_exist = true;
                                //print('User exist');
                              }

                              if(user_exist == false){
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
                                            'Wrong password',
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: ListTile(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all((Radius.circular(20.0))),
                                                ),
                                                title: Text('Enter password again '),
                                                trailing: Icon(Icons.arrow_forward),
                                                tileColor: Color.fromARGB(255, 75, 78, 122),
                                                textColor: Colors.white,
                                                iconColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ));
                              }else{
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)
                                {
                                  return PatientScreen(curr_pat_data :curr_pat_data);
                                }));
                              }
                            }
                          },
                          // onPressed
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
                              fontSize: 20,
                            ),
                          )),
                      // Add TextFormFields and ElevatedButton here.
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
    return Container(
      color: Color(0xFF0A0E21),
      height: 300,
      child: Container(

          decoration: BoxDecoration(
            color: Color.fromARGB(255, 17, 23, 56),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientRegistrationScreen(),
                          ));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Assistant',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 75, 78, 122),
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: Colors.black),
                            ))),
                  ),
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      openDialog();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 75, 78, 122),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}