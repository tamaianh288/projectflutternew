import 'package:flutter/material.dart';
import 'profile_screen.dart';

class ListMessageScreen extends StatelessWidget{
  const ListMessageScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrungLee'),
        actions: [
          InkWell(
              onTap: (){

              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/Heart.png'),
              ),
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/MoreCircle.png')
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
               onTap: (){
                 // Navigate sang manf chat
               },
                child: Container(
                  decoration: BoxDecoration(

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(image: AssetImage('assets/images/anh1.png')),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            child: Text('Guide Bot', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                            margin: EdgeInsets.all(3),
                          ),
                          Container(
                              child: Text('Chào bạn nhé. Tôi có thể giúp gì cho bạn?', style: TextStyle(color: Colors.black54)),
                              margin: EdgeInsets.all(3),
                          ),
                        ],
                      ),)
                    ],
                  ),
                ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(color: Colors.black54,),
                    prefixIcon: Image(image: AssetImage('assets/images/timkiem.png')),
                    filled: true,
                    fillColor: Colors.grey[80],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Tin nhắn', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),)
              ],
            ),
            // ListView.seperate


            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 150),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  )
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage('assets/images/anh2.png')),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('Thanh An', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(height: 3,),
                        Text('12:00', style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 15,),
                        Text('Bạn: Chào bạn nhé.', style: TextStyle(color: Colors.black54)),
                      ],
                    ),)
                ],
              ),
            ),
            SizedBox(height: 25),
            Stack(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 150),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      )
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(image: AssetImage('assets/images/anh2.png')),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text('Thanh An', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                            SizedBox(height: 3,),
                            Text('12:00', style: TextStyle(color: Colors.black54)),
                            SizedBox(height: 15,),
                            Text('Hình như anh vẫn chưa rep... ', style: TextStyle(color: Color(0xFF00D6E1))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00D6E1)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 45,),
            Expanded(child: Container(
                child:  Stack(
                  children: [
                    Positioned(
                        top:10,
                        right: 10,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFF00D6E1),
                              width: 8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF00D6E1).withOpacity(0.5),
                                blurRadius: 10, // Độ mờ
                                spreadRadius: 2, // Độ lan rộng
                                offset: const Offset(0, 0),
                              ),
                              // Lớp hào quang xa hơn (mờ hơn)
                              BoxShadow(
                                color: Colors.cyan.withOpacity(0.2),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: const Offset(0, 0),
                              ),
                              // Lớp hào quang xa hơn nữa để mượt mà
                              BoxShadow(
                                color: Colors.cyan.withOpacity(0.1),
                                blurRadius: 50,
                                spreadRadius: 0,
                                offset: const Offset(0, 0),
                              ),
                            ]
                          ),
                        )
                    ),
                  ],
                )
            ),
            ),
          ],
        ),
      ),
    );
  }
}