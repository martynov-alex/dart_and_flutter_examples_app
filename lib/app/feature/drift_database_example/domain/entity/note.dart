import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Note {
  final int id;
  final String title;
  final String? content;
  final DateTime creationDate;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.creationDate,
  });

  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? creationDate,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'creationDate': creationDate.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] != null ? map['content'] as String : null,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''Note(id: $id, title: $title, content: $content, creationDate: $creationDate)''';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.creationDate == creationDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        creationDate.hashCode;
  }
}
