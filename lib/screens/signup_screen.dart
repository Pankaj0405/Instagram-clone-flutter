import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
Uint8List? _image;
bool _isLoading=false;
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() {
    // TODO: implement createState
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }
Future<void> selectImage() async {
Uint8List im= await pickImage(ImageSource.gallery);
setState(() {
_image=im;
});
  }

  Future<void> signUpUser() async {
    setState(() {
      _isLoading=true;
    });
    String res= await AuthMethods().signUpUser(email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,);
    setState(() {
      _isLoading=false;
    });
    if(res!='success'){
showSnackBar(res , context);
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
          (context)=>const ResponsiveLayout(webScreenLayout: WebScreenLayout()
            , mobileScreenLayout: MobileScreenLayout(),),
      ),
      );
    }
  }
  void navigateToLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupScreen()));

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                SvgPicture.asset(
                  'assets/ic_instagram.svg',
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(height: 64),
                Stack(
                  children: [
                    _image!=null?CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    ):
                    CircleAvatar(
                      radius: 64,
                      backgroundImage:
                      NetworkImage('https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg'),
                    ),
                    Positioned(
                       bottom: -10,
                        left: 80,
                        child:
                    IconButton(onPressed: selectImage,
                      icon: Icon(Icons.add_a_photo),))
                  ],
                ),
                const SizedBox(height: 24),
                TextFieldInput(
                    textEditingController: _usernameController,
                    textInputType: TextInputType.text,
                    hintText: "Enter Your username"),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Enter Your email"),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _passwordController,
                  textInputType: TextInputType.text,
                  hintText: "Enter Your password",
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    textEditingController: _bioController,
                    textInputType: TextInputType.text,
                    hintText: "Enter Your bio"),
                const SizedBox(
                  height: 24,
                ),

                InkWell(
                  onTap:signUpUser,
    child: Container(
                    child: _isLoading? const Center(child: CircularProgressIndicator(
                      color: primaryColor,
                    ),) :const Text("Sign up"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        color: blueColor),
                  ),
                ),
                const SizedBox(

                  height: 24,
                ),
                const SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Already have an account?"),
                      padding: const EdgeInsets.symmetric(vertical: 8,),
                    ),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: Container(
                        child: const Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8,),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
