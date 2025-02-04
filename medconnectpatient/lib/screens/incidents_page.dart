import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/incident_model.dart';
import '../repository/incident_preference.dart';
import '../theme/constants.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  final TextEditingController _titleController = TextEditingController();
  List<IncidentModel> _incidents = [];

  @override
  void initState() {
    super.initState();
    _loadIncidents();
  }

  Future<void> _loadIncidents() async {
    List<IncidentModel> incidents = await UserPreferences.getIncidents();
    setState(() {
      _incidents = incidents;
    });
  }

  Future<void> _addIncident() async {
    final now = DateTime.now().toUtc().add(const Duration(hours: 1));
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    String title = _titleController.text;

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the incident')),
      );
      return;
    }

    IncidentModel newIncident = IncidentModel(
        title: title, time: "${now.hour}h${now.minute}", date: formattedDate);
    setState(() {
      _incidents.add(newIncident);
    });

    await UserPreferences.saveIncidents(_incidents);

    _titleController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('incident successfully added')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Image.asset(
              "assets/appbar_image.png",
              height: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                "My Incidents",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _titleController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "specify incident",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.notification_important_outlined),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: kBlueColor,
                  ),
                  onPressed: _addIncident,
                  child: Text(
                    "Add incident",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Incident list",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ), 
              Expanded(
                child: ListView.builder(
                  itemCount: _incidents.length,
                  itemBuilder: (context, index) {
                    IncidentModel incident = _incidents[index];
                    return ListTile(
                      title: Text(
                        incident.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      subtitle: Text(
                        'Time: ${incident.time} | Date: ${incident.date}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
