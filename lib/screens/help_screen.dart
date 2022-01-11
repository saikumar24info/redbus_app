// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redbus_app/screens/home_Screen/home_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help screen',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 360,
                height: 250,
                child: Image.asset('assets/images/signin.png'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Text(
                    'Verify your details',
                    style: TextStyle(
                        color: Colors.red, fontSize:20,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    cursorColor: Colors.red[400],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefix: Text('+91'),
                        prefixIcon: Icon(Icons.arrow_drop_down)),
                    maxLength: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Enter referral code(optional)',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.indigo,
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'SEND OTP(SMS)',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          GestureDetector(
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset('assets/images/google1.png'),
                              ),
                            ),
                            onTap: () {},
                          ),
                          TextButton(
                              onPressed: ()=>signup(context),
                              child: Text('   Google\nverification')),
                        ]),
                        Column(children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child:
                                    Image.asset('assets/images/facebook.png'),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text('   Facebook\nverification'))
                        ]),
                      ]),
                ]),
              ),
              Text(
                'We will not post anything on your account',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Text(
                    '              By logging in, you agree to our',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:
                        Text('Terms and', style: TextStyle(color: Colors.blue)),
                  ),
                ]),
              ),
              Text(
                'Conditions and Privacy Policy',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

    final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BusHomeScreen()));
      } 
  }
}
}
