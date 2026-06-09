import 'dart:convert';

class Note {
  String id;
  String title;
  String description;
  String priority;
  String date;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
  });

  // Convert Note to Map for JSON encoding
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'date': date,
    };
  }

  // Create Note object from Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      priority: map['priority'] ?? 'Low',
      date: map['date'] ?? '',
    );
  }

  // Helper methods for SharedPreferences List
  static String encode(List<Note> notes) =>
      json.encode(notes.map<Map<String, dynamic>>((note) => note.toMap()).toList());

  static List<Note> decode(String notesJson) =>
      (json.decode(notesJson) as List<dynamic>)
          .map<Note>((item) => Note.fromMap(item))
          .toList();
}