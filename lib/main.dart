import 'package:flutter/material.dart';
import 'list_message_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Chat',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

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
              child:
              Column(
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
                          'Email',
                          style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 17.0,),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: WidgetStateColor.resolveWith((states){
                              if(states.contains(WidgetState.focused)){
                                return Colors.red[50]!;
                              }
                              return Colors.white;
                            }),
                              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0),),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 2.0), // Có thể cho viền dày hơn chút khi focus
                              ),
                              hintText: 'trung@gmail.com',
                              prefixIcon: Icon(Icons.email, color: Colors.red[400],),
                          ),
                          style: TextStyle(color: Colors.red[800]),
                          //Đổi màu con trỏ chuột nhấp nháy thành màu đỏ
                          cursorColor: Colors.red[800],
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Mật khẩu',
                          style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: WidgetStateColor.resolveWith((states){
                              if(states.contains(WidgetState.focused)){
                                return Colors.red[50]!;
                              }
                              return Colors.white;
                            }),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0),),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 2.0), // Có thể cho viền dày hơn chút khi focus
                            ),
                            hintText: '******',
                            prefixIcon: Icon(Icons.lock, color: Colors.red[400],),
                            suffixIcon: Icon(Icons.visibility_off, color: Colors.red[400],)
                          ),
                          style: TextStyle(color: Colors.red[800]),
                          //Đổi màu con trỏ chuột nhấp nháy thành màu đỏ
                          cursorColor: Colors.red[800],
                        ),
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
                            Text('Nhớ tài khoản', style: TextStyle(color: Colors.red[800])),
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
                              child: Text('Đăng nhập', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
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
                              child: Text('hoặc đăng nhập với', style: TextStyle(color: Colors.red[400], fontSize: 12.0),),
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
                              child: Text('Khách', style: TextStyle(color: Colors.red[400]),)
                          ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(
                              text: 'Chưa có tài khoản? ',
                              children: <TextSpan>[
                                TextSpan(text: ' Đăng ký', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]))
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
    );
  }
}