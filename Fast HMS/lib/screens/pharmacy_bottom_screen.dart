import 'package:flutter/material.dart';
import 'buy_screen.dart';
import 'pharm_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class PharmBottomScreen extends StatefulWidget {
  @override
  State<PharmBottomScreen> createState() => _PharmBottomScreenState();
}

class _PharmBottomScreenState extends State<PharmBottomScreen> {
  final _formKey = GlobalKey<FormState>();

  late int pharm_id;
  late String? pharm_pass;

  @override
  Widget build(BuildContext context) {
    bool pharm_exist = false;
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
                            'ID : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Assistant',
                              color: Color.fromARGB(255, 99, 102, 147),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Assistant',
                              color: Colors.white,
                            ),
                            validator: (id) {
                              if (id.toString() == '') {
                                return 'Enter id';
                              }else {
                                pharm_id = int.parse(id.toString());
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
                            validator: (pass) {
                              if (pass == '') {
                                return 'Enter Password';
                              }else {
                                pharm_pass = pass;
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var pharm_data;
                                  try
                                  {
                                    pharm_data = await Supabase.instance.client
                                        .from('pharmacist')
                                        .select().match({'id':pharm_id,'password':pharm_pass});

                                    if (pharm_data.isEmpty) {
                                      pharm_exist = false;
                                    } else {
                                      pharm_exist = true;
                                      //print('User exist');
                                    }

                                  }catch (error) {
                                    print(error);
                                    }

                                if (pharm_exist == false) {
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
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: ListTile(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        (Radius.circular(20.0))),
                                                  ),
                                                  title:
                                                  Text('Enter password again '),
                                                  trailing:
                                                  Icon(Icons.arrow_forward),
                                                  tileColor: Color.fromARGB(
                                                      255, 75, 78, 122),
                                                  textColor: Colors.white,
                                                  iconColor: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ));
                                } else {
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return PharmScreen();
                                      }));
                                }
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
                      openDialog();
                    },
                    child: Text(
                      'Pharmacist',
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
                SizedBox(
                  child: Text(
                    'OR',
                    style:
                        TextStyle(fontFamily: 'Assistant', color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Buyer',
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
