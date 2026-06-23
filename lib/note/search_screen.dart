import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:projectflutternew/string_utils.dart';

class SearchScreen extends StatefulWidget{
  // Truyền danh sách gốc từ màn hình chính sang
  final List<Note> allNotes;

  const SearchScreen({super.key, required this.allNotes});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  List<Note> _filteredNotes = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
      //mảng rỗng
    _filteredNotes = [];
  }

  // Hàm xử lý logic tìm kiếm (Không dấu, không phân biệt hoa thường)
  void _runFilter(String enteredKeyword) {
    List<Note> results = [];
    if (enteredKeyword.isEmpty) {
      results = [];
    } else {
      String normalizedQuery = StringUtils.removeVietnameseTones(enteredKeyword).toLowerCase();

      results = widget.allNotes.where((note) {
        String normalizedTitle = StringUtils.removeVietnameseTones(note.title).toLowerCase();
        return normalizedTitle.contains(normalizedQuery);
      }).toList();
    }

    setState(() {
      _filteredNotes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525), // Màu nền tối
      body: SafeArea(
        child: Column(
          children: [
            // Ô nhập liệu (Search Bar) giống ảnh bạn gửi
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
              child: TextField(
                controller: _searchController,
                autofocus: true, //Tự động bật bàn phím
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: _runFilter, // Gọi hàm lọc khi gõ phím
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: ' Search by the keyword...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF3B3B3B), // Màu nền của ô search
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  // Nút dấu X để xoá text
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      _runFilter(''); // Xoá xong thì reset lại danh sách
                    },
                  ),
                ),
              ),
            ),

            // Danh sách kết quả tìm kiếm
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _filteredNotes.length,
                itemBuilder: (context, index) {
                  final note = _filteredNotes[index];
                  // Trả về giao diện item Note giống như ở màn hình chính
                  return InkWell(
                    onTap: () {
                      // Xử lý khi bấm vào kết quả tìm kiếm (VD: Mở màn chi tiết note)
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: note.color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        note.title,
                        style: const TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}