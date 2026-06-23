class StringUtils {
  static final login = "Đăng nhập";
  static final email = 'Email';
  static final password = 'Mật khẩu';
  static final remember = 'Nhớ tài khoản';
  static final option_login = 'hoặc đăng nhập với';
  static final guest = 'Khách';
  static final null_account = 'Chưa có tài khoản? ';
  static final sign_up = ' Đăng ký';
  static final title_list_message = 'TrungLee';
  static final guide_bot = 'Guide Bot';
  static final loi_chao_bot = 'Chào bạn nhé. Tôi có thể giúp gì cho bạn?';
  static final message = 'Tin nhắn';
  static final search = 'Tìm kiếm';
  static final thanh_an = 'Thanh An';
  static final time = '12:00';
  static final message_1 = 'Bạn: Chào bạn nhé.';
  static final message_2 = 'Hình như anh vẫn chưa rep... ';
  static final thong_tin = 'Giao diện thông tin';
  static final bai_viet = 'Giao diện Bài viết';


  static final notes = 'Notes';
  static final first_note = 'Create your first note !';
  static final title = "Title";
  static final content = "Type something...";
  static final save_option = 'Save changes ?';
  static final save = "Save";
  static final discard = "Discard";
  static final cancel = "Cancel";
  static final delete = "Delete";
  static final deleted = 'Đã xoá ghi chú thành công!';

  static String removeVietnameseTones(String str) {
    str = str.replaceAll(RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'), 'a');
    str = str.replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), 'e');
    str = str.replaceAll(RegExp(r'[ìíịỉĩ]'), 'i');
    str = str.replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), 'o');
    str = str.replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), 'u');
    str = str.replaceAll(RegExp(r'[ỳýỵỷỹ]'), 'y');
    str = str.replaceAll(RegExp(r'[đ]'), 'd');

    str = str.replaceAll(RegExp(r'[ÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴ]'), 'A');
    str = str.replaceAll(RegExp(r'[ÈÉẸẺẼÊỀẾỆỂỄ]'), 'E');
    str = str.replaceAll(RegExp(r'[ÌÍỊỈĨ]'), 'I');
    str = str.replaceAll(RegExp(r'[ÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ]'), 'O');
    str = str.replaceAll(RegExp(r'[ÙÚỤỦŨƯỪỨỰỬỮ]'), 'U');
    str = str.replaceAll(RegExp(r'[ỲÝỴỶỸ]'), 'Y');
    str = str.replaceAll(RegExp(r'[Đ]'), 'D');
    return str;
  }
}