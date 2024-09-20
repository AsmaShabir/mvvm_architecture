

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class signUpView extends StatefulWidget {
  const signUpView({super.key});

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {

      ValueNotifier<bool> obsecurePassword =ValueNotifier<bool>(true);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    FocusNode emailFocusNode=FocusNode();
    FocusNode passwordFocusNode=FocusNode();

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
      emailFocusNode.dispose();
      passwordFocusNode.dispose();
      obsecurePassword.dispose();
    }


    @override
    Widget build(BuildContext context) {
      final authViewModel =Provider.of<AuthViewModel>(context);
      final height =MediaQuery.of(context).size.height*1;
      return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  onFieldSubmitted: (value){
                    Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                  },
                ),

                ValueListenableBuilder(
                    valueListenable: obsecurePassword,
                    builder: (context,value,child){
                      return  TextFormField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: obsecurePassword.value,
                        decoration: InputDecoration(
                          labelText: 'password',
                          hintText: 'password',
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: InkWell(
                              onTap: (){
                                obsecurePassword.value =!obsecurePassword.value;
                              },
                              child: Icon(
                                  obsecurePassword.value ?
                                  Icons.visibility_off_outlined:Icons.visibility)),
                        ),
                      );
                    }),
                SizedBox(height: height*.1,),
                roundButton(
                    title: 'Sign Up',
                    loading:authViewModel.setSignUploading(true) ,
                    onpress: (){
                      if(emailController.text.isEmpty){
                        Utils.flushBarErrorMessage('please enter email', context);
                      }
                      else if(passwordController.text.isEmpty){
                        Utils.flushBarErrorMessage('please enter password', context);
                      }
                      else if(passwordController.text.length<6){
                        Utils.flushBarErrorMessage('please enter almost 6 digits', context);
                      }
                      else{
                        Map data ={
                          'email' :emailController.text.toString(),
                          'password' :passwordController.text.toString(),

                        };
                        authViewModel.signUpApi(data,context);
                        routesName.home;
                      }
                    }),
                SizedBox(height: height*.1,),
                InkWell(
                    onTap: (){},
                    child: Text('Sign up')),


              ]

          ),
        ),
      );
  }
}
