import 'package:shared_preferences/shared_preferences.dart';

class functionhelper{
  static String LoggedInKey ="LOGGEDINKEY";
  static String UserNameKey ="USERNAMEKEY";
  static String EmailKey = "EMAILKEY";

  static Future<bool>saveUserLoggedInStatus(bool isUserLoggedIn)async{
    SharedPreferences sf =await SharedPreferences.getInstance();
    return await sf.setBool(LoggedInKey,isUserLoggedIn);
  }
  static Future<bool>saveUsernameSF(String username)async{
    SharedPreferences sf =await SharedPreferences.getInstance();
    return await sf.setString(UserNameKey,username);
  }
  static Future<bool>saveUseremailSF(String email)async{
    SharedPreferences sf =await SharedPreferences.getInstance();
    return await sf.setString(EmailKey,email);
  }



  static Future<bool?>getuserLoggedInStatus()async{
    SharedPreferences sf= await SharedPreferences.getInstance();
    return sf.getBool(LoggedInKey);
  }
  static Future<String?>getUserEmailSF()async{
    SharedPreferences sf= await SharedPreferences.getInstance();
    return sf.getString(EmailKey);
  }
  static Future<String?>getUserNameSF()async{
    SharedPreferences sf= await SharedPreferences.getInstance();
    return sf.getString(UserNameKey);
  }
}