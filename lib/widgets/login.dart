import 'package:flutter/material.dart';

import 'package:mental_health_app/screens/self%20test/self_test.dart';
import 'package:mental_health_app/doctor/tabs_screen_doctor.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Select an option"), value: "Select an option"),
      const DropdownMenuItem(child: Text("Doctor"), value: "Doctor"),
      const DropdownMenuItem(child: Text("Patient"), value: "Patient"),
    ];
    return menuItems;
  }

  String selectedValue = "Select an option";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromRGBO(63, 55, 201, 1).withOpacity(1),
                const Color.fromRGBO(67, 97, 238, 1).withOpacity(1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Center(
                        child: Text(
                          'Pukaar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Text(
                            'Heal From Within!',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                            ),
                            labelText: 'Enter your Name',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                            labelText: 'Enter Email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          // keyboardType: TextInputType.,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      const Center(
                        child: Text(
                          'Please confirm the user type',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DropdownButton(
                        value: selectedValue,
                        items: dropdownItems,
                        borderRadius: BorderRadius.circular(20),
                        dropdownColor: Colors.white,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue.toString();
                          });
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (selectedValue == 'Doctor') {
                            Navigator.of(context).pushReplacementNamed(
                                TabsScreenDoctor.routeName);
                          } else {
                            Navigator.of(context)
                                .pushReplacementNamed(SelfTest.routeName);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color.fromRGBO(67, 97, 238, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
