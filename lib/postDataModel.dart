class PostData {
  final int id;
  final String title;
  final String body;

  PostData({this.id, this.title, this.body});

  factory PostData.fromJson(Map<String, dynamic> json){
    return PostData(
      id:json['id'],
      title:json['title'],
      body:json['body']
    );
  }
}
