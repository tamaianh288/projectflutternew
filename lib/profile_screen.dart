import 'package:flutter/material.dart';
import 'package:projectflutternew/string_utils.dart';
import 'FakeData.dart';

class ProfileScreen extends StatefulWidget{
  ProfileScreen({super.key});
  int? a;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 300.0, // Chiều cao tối đa của ảnh bìa
                    floating: false,
                    pinned: true, // Ghim thanh TabBar lại ở trên cùng khi cuộn qua ảnh bìa
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset('assets/images/Top.png', fit: BoxFit.cover),
                          Positioned(
                              bottom: 65,
                              left: 20,
                              child: Container(
                                width: 145,
                                height: 180,
                                child: Image.asset('assets/images/thanhAn.png', fit: BoxFit.cover,),
                          )),
                          Positioned(
                              right: 25,
                              bottom: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Thanh An', style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 20),
                                  Text('#sinhviendaihoc #kimnguuthang5', style: TextStyle(fontSize: 15,color: Colors.white)),
                                  Text('#clbsinhvientinhnguyen', style: TextStyle(fontSize: 15,color: Colors.white)),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      SizedBox(height: 17, width: 17, child: Image(image: AssetImage('assets/images/Profile.png')),),
                                      Text('141', style: TextStyle(color: Colors.white, fontSize: 17)),
                                      SizedBox(width: 25),
                                      SizedBox(height: 17, width: 17, child: Image(image: AssetImage('assets/images/Heart2.png'))),
                                      Text('1K', style: TextStyle(color: Colors.white, fontSize: 17))
                                    ],
                                  ),
                                ],
                              ),
                          ),
                          Positioned(
                              top: 60,
                              left: 30,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                                child: Icon(Icons.arrow_back_ios_new, color: Colors.white,),
                              )
                          ),
                          Positioned(
                              top: 60,
                              right: 30,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.4),
                                ),
                                child: Icon(Icons.more_horiz, color: Colors.white,),
                                )
                          ),
                          Positioned(
                              top: 60,
                              right: 85,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                                child: Icon(Icons.star_outline, color: Colors.white,),
                              )
                          ),
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(kTextTabBarHeight),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )
                          ),
                          child: TabBar(
                              isScrollable: true, //dồn lại theo nội dung chữ
                              tabAlignment: TabAlignment.start,
                              indicatorColor: Colors.black,       // Màu thanh gạch chân dưới tab được chọn
                              labelColor: Colors.black,           // Màu chữ của tab được chọn
                              unselectedLabelColor: Colors.grey[800],  // Màu chữ của các tab còn lại

                              tabs: [
                                Tab(text: 'Thông tin'),
                                Tab(text: 'Bài viết',),
                                Tab(text: 'Ảnh',),
                              ],
                          ),
                        ),
                    ),
                    automaticallyImplyLeading: false,
                  ),
                ];
              },
              body: TabBarView(
                  children: [
                    Center(child: Text(StringUtils.thong_tin),),
                    Center(child: Text(StringUtils.bai_viet),),
                    Center(child: GridView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: FakeData.listFakeData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, //2cột
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75 // Tỷ lệ rộng/cao. Số < 1 giúp ảnh hiển thị dạng hình chữ nhật đứng
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [ 
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(FakeData.listFakeData[index].url, fit: BoxFit.cover, ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 15,
                                child: Icon(Icons.remove_red_eye_outlined, color: Colors.white,)),
                              Positioned(
                                bottom: 17,
                                left: 50,
                                child: Text(FakeData.listFakeData[index].count.toString(), style: TextStyle(color: Colors.white),))
                            ],
                          );
                        }
                    ),
                    ),
                  ]
              )
        ),
        ),
    );
  }


}