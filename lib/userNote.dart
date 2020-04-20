class UserNote {
  int id;
  String username;
  String note;

  UserNote({this.id, this.username, this.note});

  factory UserNote.fromJson(Map<String, dynamic> json) {
    return UserNote(
      id: json['id'] as int,
      username: json['username'] as String,
      note: json['note'] as String,
    );
  }

}