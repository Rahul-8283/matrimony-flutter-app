import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bright_weddings/View/Login/login_original_firebase.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animate_do/animate_do.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  String? selectedRole;
  bool hide = false;

  // Guard so we don't push multiple times if the animation completes repeatedly.
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 30.0)
        .animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && !_isNavigating) {
          _isNavigating = true;

          // Determine target page based on selected role
          final targetPage = (selectedRole == "Login")
              ? LoginOriginalFirebase(startWithRegister: false)
              : LoginOriginalFirebase(startWithRegister: true);

          Navigator.push(
            context,
            PageTransition(type: PageTransitionType.fade, child: targetPage),
          ).then((_) {
            // When coming back, reset animation and show buttons again
            if (mounted) {
              setState(() {
                hide = false;
                selectedRole = null;
              });
              _scaleController.reverse(); // Animate back to original
            }
            _isNavigating = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/brightWedding.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: Text(
                    "Connecting Hearts, Joining Lives",
                    style: TextStyle(
                      color: const Color(0xFFF3D48A),
                      height: 1.2,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 13),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                      selectedRole = "Login";
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6CB8A),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: hide == false
                                ? Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                      selectedRole = "Register";
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6CB8A),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: hide == false
                                ? Text(
                                    "Register",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
