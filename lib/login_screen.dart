import 'package:flutter/material.dart';
import 'package:projectflutternew/string_utils.dart';
import 'list_message_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  bool isRemembered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/brgLogin.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Image(
                    image: AssetImage('assets/images/ImageLogin.png'),
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.width*0.95,
                    width: MediaQuery.of(context).size.width*0.85,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringUtils.email,
                          style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 17.0,),
                        ),
                        _textField(iconPre: Icons.email, hintText: StringUtils.email),
                        SizedBox(height: 20,),
                        Text(
                          StringUtils.password,
                          style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        _textField(iconPre: Icons.lock, hintText: StringUtils.password, iconSuf: Icons.visibility_off, obscureText: true),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Checkbox(
                              value: isRemembered,
                              activeColor: const Color(0xFFEF5350),
                              side: const BorderSide(color: Color(0xFFEF5350),width: 1.0),
                              onChanged: (bool? newValue){
                                setState(() {
                                  isRemembered = newValue ?? false;
                                });
                              },
                            ),
                            Text(StringUtils.remember, style: TextStyle(color: Colors.red[800])),
                          ],
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListMessageScreen(),));
                            },
                            child: Text(StringUtils.login, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[400],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(child: Divider(
                              color: Colors.red[400],
                              thickness: 1,
                            ),),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(StringUtils.option_login, style: TextStyle(color: Colors.red[400], fontSize: 12.0),),
                            ),
                            Expanded(child: Divider(
                              color: Colors.red[400],
                              thickness: 1,
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color(0xFFEF5350), width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: (){},
                              child: Text(StringUtils.guest, style: TextStyle(color: Colors.red[400]),)
                          ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(
                              text: StringUtils.null_account,
                              children: <TextSpan>[
                                TextSpan(text: StringUtils.sign_up, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]))
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required IconData? iconPre,
    String? hintText,
    IconData? iconSuf,
    bool? obscureText,
  }) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: WidgetStateColor.resolveWith((states){
          if(states.contains(WidgetState.focused)){
            return Colors.red[50]!;
          }
          return Colors.white;
        }),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(10),// Có thể cho viền dày hơn chút khi focus
        ),
      ),
      style: TextStyle(color: Colors.red[800]),
      //Đổi màu con trỏ chuột nhấp nháy thành màu đỏ
      cursorColor: Colors.red[800],
    );
  }
}