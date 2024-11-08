// import 'package:ecommerceapp/screen/user-panel/main-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

// class Riverlogin extends StatefulWidget {
//   const Riverlogin({super.key});

//   @override
//   State<Riverlogin> createState() => _RiverloginState();
// }

// class _RiverloginState extends State<Riverlogin> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   var aimationlink = "assets/images/login.riv";
//   SMIInput<bool>? isChecking;
//   SMIInput<bool>? isHandsUp;
//   SMIInput<bool>? trigSuccess;
//   SMIInput<bool>? trigFail;
//   late StateMachineController? stateMachineController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffD6E2EA),
//       appBar: AppBar(
//         title: const Text(
//           'Login Page',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xff6C3428),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // if (artBoard != null)
//               SizedBox(
//                   height: 350,
//                   width: 400,
//                   child: RiveAnimation.asset(
//                     animationLink,
//                     fit: BoxFit.fill,
//                     stateMachines: ['Login Machine'],
//                     onInit: (artBoard) {
//                       stateMachineController =
//                           StateMachineController.fromArtboard(
//                               artBoard, 'Login Machine');
//                       if (stateMachineController == null) return;
//                       artBoard.addController(stateMachineController!);
//                       isChecking =
//                           stateMachineController?.findInput('isChecking');
//                       isHandsUp =
//                           stateMachineController?.findInput('isHandsUp');
//                       trigSuccess =
//                           stateMachineController?.findInput('trigSuccess');
//                       trigFail = stateMachineController?.findInput('trigFail');
//                     },
//                   )),
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xff413142),
//                   // color: Colors.grey.shade400,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 height: 320.0,
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextFormField(
//                           onChanged: (value) {
//                             if (isHandsUp != null) {
//                               isHandsUp!.change(false);
//                             }
//                             if (isChecking == null) return;
//                             isChecking!.change(true);
//                           },
//                           controller: _usernameController,
//                           decoration: const InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             filled: true,
//                             // fillColor: Colors.grey.withOpacity(0.5),
//                             fillColor: Color.fromRGBO(128, 128, 128, 0.5),
//                             labelText: 'Username',
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                               // Border color when focused
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               // Border color when not focused
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               // Border color when not focused
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               // Border color when not focused
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your username';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16.0),
//                         TextFormField(
//                           onChanged: (value) {
//                             if (isChecking != null) {
//                               isChecking!.change(false);
//                             }
//                             if (isHandsUp == null) return;
//                             isHandsUp!.change(true);
//                           },
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             filled: true,
//                             // fillColor: Colors.grey.withOpacity(0.5),
//                             fillColor: Color.fromRGBO(128, 128, 128, 0.5),
//                             labelText: 'Password',
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                               // Border color when focused
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               // Border color when not focused
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 40.0),
//                         Container(
//                           height: 50.0,
//                           width: 300.0,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25.0),
//                               border:
//                               Border.all(color: Colors.blue, width: 2.0),
//                               color: Colors.blue),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // Perform login logic here
//                                 String username = _usernameController.text;
//                                 String password = _passwordController.text;
//                                 // Add your authentication logic here
//                                 print(
//                                     'Logging in: $username with password: $password');
//                                 isChecking!.change(false);
//                                 isHandsUp!.change(false);
//                                 trigFail!.change(false);
//                                 trigSuccess!.change(true);
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => MainScreen()),
//                                 );
//                               } else {
//                                 isChecking!.change(false);
//                                 isHandsUp!.change(false);
//                                 trigSuccess!.change(false);
//                                 trigFail!.change(true);
//                               }
//                             },
//                             child: Text('Login'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }