import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'Controller/screen_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
// import 'View/Profile/ProfileDetails/profile_details.dart';
import 'View/Dashboard/dashboard_mob.dart';
import 'View/Dashboard/dashboard_demo.dart';
import 'Helper/size_config.dart';
import 'View/Login/home.dart';
import 'View/Discover/discover_page.dart';
import 'firebase_options.dart';
import 'View/Login/login_mobile.dart';
import 'View/Login/login_web.dart';
import 'View/Login/responsive_login.dart';
import 'View/Login/auth_wrapper.dart';
import 'View/Login/login_web_simple.dart';
import 'View/Login/login_fallback.dart';
import 'View/Login/login_original_firebase.dart';
import 'Controller/auth_controller.dart';
import 'Controller/edit_profile_controller.dart';
import 'Controller/profile_controller.dart';
import 'Controller/animation_controller.dart' as custom;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Try Firebase initialization with comprehensive error handling
  bool firebaseInitialized = false;
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      
      // Test Firebase Auth specifically to catch minification issues
      try {
        FirebaseAuth.instance.authStateChanges().listen((user) {
          // This listener helps initialize Firebase Auth properly
        });
        firebaseInitialized = true;
        print("Firebase and Firebase Auth initialized successfully");
      } catch (authError) {
        print("Firebase Auth initialization failed: $authError");
        firebaseInitialized = false;
      }
    }
  } catch (e) {
    print("Firebase initialization failed: $e");
    // Continue without Firebase - use fallback auth
    firebaseInitialized = false;
  }
  
  // Initialize GetX controllers with error handling
  try {
    Get.put(ScreenController());
    Get.put(NewRegistrationController());
    Get.put(AuthController());
    Get.put(EditProfileController());
    Get.put(ProfileController());
    Get.put(custom.AnimationController());
    print("Controllers initialized successfully");
  } catch (e) {
    print("Controller initialization error: $e");
  }
  
  runApp(MyApp(firebaseEnabled: firebaseInitialized));
}
class MyApp extends StatelessWidget {
  final bool firebaseEnabled;
  
  const MyApp({super.key, this.firebaseEnabled = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context2, Orientation orientation) {
            SizeConfig.init(constraints, orientation);  
            return GetMaterialApp(
              title: "Bright Weddings",
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE6CB8A)),
                primaryColor: Color(0xFFE8C468),
              ),
              routes: {
                '/': (context) => LoginHome(),
                '/login': (context) => LoginOriginalFirebase(),
                '/home': (context) => DashboardMob(),
                '/discover': (context) => DiscoverPage(),
                '/responsive-login': (context) => ResponsiveLogin(),
                '/LoginMobile': (context) => LoginMobile(),
              },
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
            );
          },
        );
      },
    );
  }
}

