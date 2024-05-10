import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/myButton.dart';
import '../utils/utils.dart';
import '../view_model/login_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  ValueNotifier<bool> secure=ValueNotifier(false);
  var email=TextEditingController();
  var password=TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        title:const Text('Signup view'),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
            child: TextFormField(
              controller:email,
              focusNode:emailFocusNode,
              obscuringCharacter:'*',
              decoration:const InputDecoration(
                  hintText:'Enter Email',
                  border:OutlineInputBorder(
                      borderSide:BorderSide(
                          color:Colors.lightBlueAccent
                      )
                  ),
                  suffixIcon:  Icon(Icons.email)
              ),
              onFieldSubmitted:(val){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },

            ),
          ),
          ValueListenableBuilder(valueListenable: secure, builder:(context,value,child){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
              child: TextFormField(
                obscureText:secure.value,
                controller:password,
                focusNode:passwordFocusNode,
                obscuringCharacter:'*',
                decoration:InputDecoration(
                    hintText:'Enter Password',
                    border:const OutlineInputBorder(
                        borderSide:BorderSide(
                            color:Colors.lightBlueAccent
                        )
                    ),
                    suffixIcon:InkWell(
                        onTap:(){
                          secure.value=!secure.value;
                        },
                        child:secure.value?const Icon(Icons.visibility):const Icon(Icons.visibility_off))
                ),

              ),
            );

          }),
          Consumer<LoginViewModel>(builder: (context,val,child){
            return   MyButton(
                loading:val.loading,
                onTap: () {
                  if(email.text.isEmpty){
                    Utils.toastMessage('Enter email');
                  }
                  else if(password.text.isEmpty)
                  {
                    Utils.snackBar('Enter password', context);
                  }
                  else{
                    Map data={
                      'email':email.text,
                      'password':password.text,
                    };
                    val.login(data, context);
                  }
                }, title:'sign up');
          }),

        ],
      ),
    );
  }

}
