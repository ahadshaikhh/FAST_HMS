import 'package:fast_hms/screens/home_screen.dart';
import 'package:fast_hms/screens/pharm_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class updatestock extends StatefulWidget {
  const updatestock({super.key});

  @override
  State<updatestock> createState() => _updatestockState();
}

class _updatestockState extends State<updatestock> {
  int panadol = 0,
      calpol = 0,
      nexum = 0,
      augmentin = 0,
      methycobal = 0,
      brufen = 0,
      citanew = 0,
      flagyl = 0,
      strepsills = 0,
      norvasac = 0;
  @override
  Widget build(BuildContext context) {
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
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PharmScreen();
                }));
              },
            ),
            GButton(
              icon: Icons.logout,
              text: 'About',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return homescreen();
                }));
              },
            ),
          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Update Stock'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(
                        icon: Icons.remove,
                      ),
                      onTap: () {
                        setState(
                              () {
                            panadol--;
                          },
                        );
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(
                        icon: Icons.add,
                      ),
                      onTap: () {
                        setState(() {
                          panadol++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Panadol',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      panadol.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          calpol--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          calpol++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Calpol',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      calpol.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          augmentin--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          augmentin++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Augmentin',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      augmentin.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          nexum--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(
                        icon: Icons.add,
                      ),
                      onTap: () {
                        setState(() {
                          nexum++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Nexum',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      nexum.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          methycobal--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          methycobal++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Methycobal',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      methycobal.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          brufen--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          brufen++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Brufen',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      brufen.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          citanew--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          citanew++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Citanew',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      citanew.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          flagyl--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          flagyl++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Flagyl',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      flagyl.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          strepsills--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          strepsills++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Strepsills',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      strepsills.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      child: BuyMenu(icon: Icons.remove),
                      onTap: () {
                        setState(() {
                          norvasac--;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: BuyMenu(icon: Icons.add),
                      onTap: () {
                        setState(() {
                          norvasac++;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Norvasac',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      norvasac.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 102, 147),
                          fontSize: 25,
                          fontFamily: 'Assistant',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '* Note:  Adding 1 means adding 1 to total no of tablets. ',
                  style: TextStyle(
                    fontFamily: 'Assistant',
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () async{
                          List<String> outOfStock = [];
                          if(norvasac!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'norvasac'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (norvasac);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name':'norvasac'});
                            }
                          }

                          if(panadol!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'panadol'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (panadol);

                            if(quan1 < 0){
                            outOfStock.add(q1[0]['name']);
                            }else {
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1})
                                  .match({ 'name': 'panadol'});
                            }
                          }

                          if(calpol!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'calpol'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (calpol);

                            if(quan1 < 0){
                            outOfStock.add(q1[0]['name']);
                            }else {
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1})
                                  .match({ 'name': 'calpol'});
                            }
                          }

                          if(augmentin!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'augmentin'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (augmentin);

                            if(quan1 < 0){
                            outOfStock.add(q1[0]['name']);
                            }else {
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1})
                                  .match({ 'name': 'augmentin'});
                            }
                          }

                          if(nexum!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'nexum'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (nexum);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name': 'nexum'});
                            }

                          }

                          if(methycobal!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'methycobal'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (methycobal);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name': 'methycobal'});
                            }
                          }

                          if(brufen!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'brufen'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (brufen);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name': 'brufen'});
                            }

                          }

                          if(citanew!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'citanew'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (citanew);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name': 'citanew'});
                            }

                          }

                          if(flagyl!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'flagyl'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (flagyl);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name': 'flagyl'});
                            }
                          }

                          if(strepsills!=0){
                            final q1 = await Supabase.instance.client
                                .from('medicines')
                                .select('name,quantity')
                                .match({'name': 'strepsills'});

                            int quan1 = q1[0]['quantity'];
                            quan1 = quan1 + (panadol);

                            if(quan1 < 0){
                              outOfStock.add(q1[0]['name']);
                            }else{
                              final data = await Supabase.instance.client
                                  .from('medicines')
                                  .update({ 'quantity': quan1 })
                                  .match({ 'name': 'strepsills'});
                            }
                          }

                          bool areOutOfStock;
                          print(outOfStock);
                          print(' Out of Stock ');
                          if(outOfStock.isEmpty){
                            areOutOfStock = true;
                          }else{
                            areOutOfStock = false;
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
                                      'Stock updated',
                                      style: TextStyle(color: Colors.white,
                                          fontSize: 22),
                                    ),
                                    content: Column(
                                      children: [
                                        Text(
                                          'Following medicines are out of stock : ',
                                          style:TextStyle(color: Colors.red),),

                                        Container(
                                          height: 100,
                                          width: 150,
                                          child: ListView.builder(
                                              itemCount: outOfStock.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                if(outOfStock.length==0){
                                                  print('Nill');
                                                  return ListTile(
                                                    title: Text('NILL',style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 15)),
                                                  );

                                                }else {
                                                  print('not nill');
                                                  return ListTile(
                                                      title: Text(
                                                          outOfStock[index],
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 15)));
                                                }
                                              }),
                                        ),

                                      ],
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ));

                        },
                        icon: Icon(Icons.update_outlined),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 35, 37, 64),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(58),
                              side: BorderSide(color: Colors.black),
                            ))),
                        label: Text(
                          'Update',
                          style: TextStyle(
                            fontFamily: 'Assistant',
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

class BuyMenu extends StatelessWidget {
  BuyMenu({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        color: Colors.white,
        size: 50,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(255, 35, 37, 64),
          border: Border.all(width: 2)),
    );
  }
}