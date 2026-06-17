class FakeData {
  static final listFakeData = [
    StatusEntity(1,100, "assets/images/bot.png"),
    StatusEntity(1,200, "assets/images/bot.png"),
    StatusEntity(1,300, "assets/images/bot.png"),
    StatusEntity(1,1240, "assets/images/bot.png"),
    StatusEntity(1,12300, "assets/images/bot.png"),
  ];
}

class StatusEntity {
  final int id;
  final int count;
  final String url;

  StatusEntity (this.id, this.count, this.url);
}