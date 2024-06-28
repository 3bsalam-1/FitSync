import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitsync/data/repository/google_login.dart';
import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future signInWithGodogle(context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if (googleUser == null) return;

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  //print("name is ${googleUser!.displayName}");
  //print("email is ${googleUser.email}");
  ContinueWithGoogle().continueWithGoogle(name: "${googleUser.displayName}", email: googleUser.email, avatar: "${googleUser.photoUrl}");
  
  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
  // todo here add HomeMainScreen
  AnimatedNavigator().pushAndRemoveUntil(context , const HomePage());
}
