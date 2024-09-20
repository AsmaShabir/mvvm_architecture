

import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
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
        title: Text('Login'),
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
                title: 'Login',
                loading:authViewModel.loading ,
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
                authViewModel.loginApi(data,context);
                routesName.home;
              }
            }),
            SizedBox(height: height*.1,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, routesName.signup);
              },
                child: Text('Sign up')),


            ]

        ),
      ),
    );
  }
}
