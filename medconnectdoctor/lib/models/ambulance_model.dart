class AmbulanceModel {
  final String? title;
  final String? speciality;
  final String? phone;
  final String? adress;

  const AmbulanceModel({
    this.title,
    this.speciality,
    this.phone,
    this.adress,
  });
}

List<AmbulanceModel> listAmbulances = [
  const AmbulanceModel(
    title: "Urgence Plus",
    speciality: "Transport médicalisé",
    phone: "55234567",
    adress: "Tunis, Tunisie",
  ),
  const AmbulanceModel(
    title: "MediRescue",
    speciality: "Ambulance privée et urgence",
    phone: "55891234",
    adress: "Paris, France",
  ),
  const AmbulanceModel(
    title: "RapidCare Ambulance",
    speciality: "Transfert inter-hospitalier",
    phone: "55781236",
    adress: "Rome, Italie",
  ),
  const AmbulanceModel(
    title: "VitalAid Services",
    speciality: "Assistance médicale et secours",
    phone: "55478952",
    adress: "Madrid, Espagne",
  ),
  const AmbulanceModel(
    title: "SafeRide Ambulance",
    speciality: "Évacuation d'urgence",
    phone: "55123698",
    adress: "New York, USA",
  ),
  const AmbulanceModel(
    title: "Ambulance Al Hilal",
    speciality: "Soins d'urgence et rapatriement",
    phone: "55678941",
    adress: "Casablanca, Maroc",
  ),
];
