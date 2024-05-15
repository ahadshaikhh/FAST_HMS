import 'package:fast_hms/screens/bmi_calculator.dart';
import 'package:fast_hms/screens/book_appointment.dart';
import 'package:fast_hms/screens/diet_suggestion.dart';
import 'package:fast_hms/screens/patient_appointments.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cancel_appointment.dart';
import 'home_screen.dart';

bool got_data = false;

// dynamic get_pat_data(String? email) async {
//   curr_pat_data = await Supabase.instance.client.from('Patient').select('p_id').match(
//       {'email': email});
//   print('In func');
//   print(curr_pat_data[0]['p_id']);
//   return curr_pat_data;
// }


class PatientScreen extends StatefulWidget {
  PatientScreen({Key? key, required this.curr_pat_data}):super(key: key);
  var curr_pat_data;

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    //print(widget.curr_patient);
    return Scaffold(
      bottomNavigationBar: GNav(
            tabBorderRadius: 400,
            tabBackgroundColor: Color.fromARGB(255, 35, 37, 64),
            color: Colors.white,
            activeColor: Colors.white,
            hoverColor: Color.fromARGB(255, 35, 37, 64),
            backgroundColor: Color(0xFF0A0E21),
            tabs: [
              GButton(icon: Icons.person, text: ' Home',
                onPressed: (){

                },
              ),

              GButton(icon: Icons.logout, text: 'Logout',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return homescreen();
                  }));
                },
              )

            ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Patient Screen')),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                     Row(
                      children: [
                        Text(
                          'Hello ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 92, 101, 158),
                            fontSize: 27,
                          ),
                        ),
                        Text(
                          widget.curr_pat_data[0]['name'].toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 92, 101, 158),
                              fontSize: 27),
                        ),
                        Text(
                          '!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 92, 101, 158),
                              fontSize: 27),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return bookappointment(curr_pat_data:widget.curr_pat_data);
                        }));
      
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 35, 37, 64),
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black),
                              ))),
                      child: Text(
                        'Book Appointment'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Assistant',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return cancelAppointment(curr_pat_data:widget.curr_pat_data);
                        }));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 35, 37, 64),
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black),
                              ))),
                      child: Text(
                        'Cancel Appointment'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Assistant',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                      onPressed: () async {
                        bool have_app;
                        var pat_app = await Supabase.instance.client
                            .from('appointments')
                            .select()
                            .match({'patient_id':widget.curr_pat_data[0]['p_id']});
      
                        if(pat_app.isEmpty){
                          have_app = false;
                        }else{
                          have_app = true;
                        }
      
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return patientAppointments(curr_pat_data:widget.curr_pat_data, have_appoint: have_app,);
                        }));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 35, 37, 64),
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black),
                              ))),
                      child: Text(
                        'your Appointment(s)'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Assistant',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return InputPage();
                        }));
      
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 35, 37, 64),
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black),
                              ))),
                      child: Text(
                        'BMI Calculator'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Assistant',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return diet();
                        }));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 35, 37, 64),
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black),
                              ))),
                      child: Text(
                        'Diet Suggestion'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Assistant',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}