class IncidentModel {
  final String title;
  final String time;
  final String date;

  IncidentModel({required this.title, required this.time, required this.date});

  // Convertir l'objet User en JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time,
      'date': date,
    };
  }

  // Créer un objet User depuis un JSON
  factory IncidentModel.fromJson(Map<String, dynamic> json) {
    return IncidentModel(
      title: json['title'],
      time: json['time'],
      date: json['date'],
    );
  }
}
