import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {

  // LoginScreenController controller = Get.put(LoginScreenController());

  TextEditingController employeeIdController = TextEditingController(text:"");
  TextEditingController passwordController = TextEditingController(text:"");


  bool rememberMe = false;
  bool _isChecked = false;


  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80,),
              // SizedBox(
              //   height: 220,
              //   width: 220,
              //   child: Image.asset("assets/icons/login_image.png"),
              // ),
              const SizedBox(height: 50,),
              userNameInputField(),
              const SizedBox(height: 20,),
              passwordInputField(),
              const SizedBox(height: 20,),
              rememberMeCheckBox(),
              const SizedBox(height: 20,),
              loginButton(),
              SizedBox(height:100),
              // SizedBox(
              //   height: 60,
              //   width: 150,
              //   child: Image.asset("assets/icons/logo.png"),
              // )
            ],
          ),
        ));
  }

  Container userNameInputField(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(left: 12),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:Colors.grey, width: 1.0)
      ),
      child: Row(
        children: [
          // SizedBox(
          //   height: 24,
          //   width: 24,
          //   child: Image.asset("assets/icons/profile_avatar.png"),
          // ),
          const SizedBox(width: 12,),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
              controller: employeeIdController,
              keyboardType: TextInputType.text,
              textInputAction:TextInputAction.next,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  isDense: true,
                  hintText: "Enter Employee Id",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none
              ),
            ),
          )
        ],
      ),

    );
  }

  Container passwordInputField(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(left: 12),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:Colors.black, width: 1.0)
      ),
      child: Row(
        children: [
          // SizedBox(
          //   height: 24,
          //   width: 24,
          //   child: Image.asset("assets/icons/key_icon.png"),
          // ),
          SizedBox(width: 12,),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
              textInputAction:TextInputAction.done,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  isDense: true,
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none
              ),
            ),
          )
        ],
      ),

    );
  }

  Container rememberMeCheckBox(){
    return Container(
      margin: const EdgeInsets.only(left:20),
      child: Row(
        children: [
          Checkbox(
              activeColor:Colors.blueAccent ,
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)
              ),
              side:  BorderSide(width: 1.0, color: Colors.blueAccent),
              value: _isChecked,
              onChanged: _handleRemeberme
          ),
          // SizedBox(width: 12,),
          const Text("Remember Me", textScaleFactor: 1.0, style: TextStyle(color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.w500),)

        ],
      ),
    );
  }


  void _handleRemeberme(bool? value) {
    print("Handle Rember Me");
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value!);
        prefs.setString('employee_id',employeeIdController.text);
        prefs.setString('password', passwordController.text);
      },
    );

    setState(() {
      _isChecked = value!;
    });
  }


  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();


      print("Load Email");
      var employeeId = _prefs.getString("employee_id") ?? "";
      var password = _prefs.getString("password") ?? "";
      var rememberMe = _prefs.getBool("remember_me") ?? false;

      print("remember_me ${rememberMe}");
      print(employeeId);
      print("password print    $password");
      if (rememberMe) {
        setState(() {
          _isChecked = true;
        });
        employeeIdController.text =  employeeId ;
        passwordController.text = password;
      }
    } catch (e) {
      print(e);
    }
  }

  InkWell loginButton(){
    return InkWell(
      onTap: (){
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: const Text("LOGIN", textScaleFactor: 1.0, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),

      ),
    );
  }
}