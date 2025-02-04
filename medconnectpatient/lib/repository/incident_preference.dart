import 'dart:convert';

import 'package:medconnectpatient/models/incident_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> saveIncidents(List<IncidentModel> incidents) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> userList =
        incidents.map((incident) => jsonEncode(incident.toJson())).toList();

    await prefs.setStringList('incidents', userList);
  }

  static Future<List<IncidentModel>> getIncidents() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? incidentList = prefs.getStringList('incidents');

    if (incidentList == null) return [];

    return incidentList
        .map((incidentJson) => IncidentModel.fromJson(jsonDecode(incidentJson)))
        .toList();
  }
}
