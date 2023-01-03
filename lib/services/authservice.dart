import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/helper/functionhelper.dart';
import 'package:untitled/services/databaseservice.dart';

class Auth_service{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;


  Future loginUserWithEmailandPassword(String email,String password) async{
    try{
      User user =(await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;

      if(user!=null){
        return true;
      }
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }


  Future registerUserWithEmailandPassword(String fullname, String email,String password) async{
    try{
      User user =(await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

      if(user!=null){
       await DatabaseService(uid: user.uid).savinguserdata(fullname, email);
        return true;
      }
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  Future signout()async{
    try{
      await functionhelper.saveUserLoggedInStatus(false);
      await functionhelper.saveUsernameSF("");
      await functionhelper.saveUseremailSF("");
      await _firebaseAuth.signOut();
    }catch(e){
      return null;
    }
  }
}