import 'package:fast_hms/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class updateDoctor extends StatefulWidget {
  updateDoctor({Key? key, required this.curr_doc_data}):super(key: key);
  var curr_doc_data;

  @override
  State<updateDoctor> createState() => _updateDoctorState();
}

class _updateDoctorState extends State<updateDoctor> {
  final _formKey = GlobalKey<FormState>();

  String? s1, s2, s3, password, password1;

  @override
  Widget build(BuildContext context) {
    print(widget.curr_doc_data[0]['id'].toString());
    return Scaffold(
      bottomNavigationBar: GNav(
          tabBorderRadius: 400,
          tabBackgroundColor: Color.fromARGB(255, 35, 37, 64),
          color: Colors.white,
          activeColor: Colors.white,
          hoverColor: Color.fromARGB(255, 35, 37, 64),
          backgroundColor: Color(0xFF0A0E21),
          tabs: [
            GButton(
              icon: Icons.person,
              text: ' Home',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            
            GButton(
              icon: Icons.logout,
              text: 'Logout',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return homescreen();
                }));
              },
            ),
          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Update Your Details')),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50),
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
                        'Name : ',
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
                            s1 = '';
                            return null;
                          } else {
                            s1 = name;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Specialization : ',
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
                        validator: (specialization) {
                          if (specialization == '') {
                            s2 = '';
                            return null;
                          } else {
                            s2 = specialization;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email : ',
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
                          if(email== ''){
                            s3 = '';
                            return null;
                          }else if (!EmailValidator.validate(email.toString())) {
                            return 'Enter a valid email';
                          } else {
                            s3 = email;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'New Password: ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Assistant',
                              color: Color.fromARGB(255, 99, 102, 147),
                            ),
                          ),
                          
                        ],
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
                          if (pass == '' ) {
                            password= '';
                            return null;
                          }
                           else {
                            password = pass;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Confirm Password : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Assistant',
                              color: Color.fromARGB(255, 99, 102, 147),
                            ),
                          ),
                         
                        ],
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
                          if (pass == '' && password!='') {
                            password1 = '';
                            return 'Confirm Password';
                          }else if (pass != password) {
                            return 'Passwords do not match';
                          }else {
                            password1 = pass;
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      Text(
                            'Note: Please reload the application so that changes could take effect. ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Assistant',
                              color: Color.fromARGB(255, 209, 91, 82),
                            ),
                          ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                          onPressed: () async {
                            String? dialog_msg;
                            if (_formKey.currentState!.validate()) {
                              if(s1 == '' && s2== '' && s3== '' && password=='' && password1==''){
                                dialog_msg = 'Atleast enter one field';
                              }else{
                                dialog_msg = 'Information updated successfully';
                                if(s1!=''){
                                  await Supabase.instance.client.from('Doctors').update(
                                      {'name':s1,}).match({'id':widget.curr_doc_data[0]['id']});
                                }
                                if(s2!=''){
                                  await Supabase.instance.client.from('Doctors').update(
                                      {'specialization':s2, }).match({'id':widget.curr_doc_data[0]['id']});
                                }
                                if(s3!=''){
                                  await Supabase.instance.client.from('Doctors').update(
                                      {'email':s3,}).match({'id':widget.curr_doc_data[0]['id']});
                                }
                                if(password1!=''){
                                  await Supabase.instance.client.from('Doctors').update(
                                      {'password':password1,}).match({'id':widget.curr_doc_data[0]['id']});
                                }

                              }

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
                                              if(dialog_msg=='Information updated successfully'){
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }else if(dialog_msg=='Atleast enter one field'){
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
                              backgroundColor: MaterialStateProperty.all<Color>(
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