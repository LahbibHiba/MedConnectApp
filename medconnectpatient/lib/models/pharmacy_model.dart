class PharmacyModel {
  final String? title;
  final String? speciality;
  final String? phone;
  final String? adress;

  const PharmacyModel({
    this.title,
    this.speciality,
    this.phone,
    this.adress,
  });
}

List<PharmacyModel> listPharmacies = [
  const PharmacyModel(
    title: "Pharmacie Centrale",
    speciality: "Médicaments et produits pharmaceutiques",
    phone: "55234567",
    adress: "Tunis, Tunisie",
  ),
  const PharmacyModel(
    title: "PharmaVie",
    speciality: "Produits pharmaceutiques et parapharmacie",
    phone: "55891234",
    adress: "Paris, France",
  ),
  const PharmacyModel(
    title: "Farmacia Italia",
    speciality: "Médicaments et soins de santé",
    phone: "55781236",
    adress: "Rome, Italie",
  ),
  const PharmacyModel(
    title: "Salud Pharma",
    speciality: "Pharmacie et services de santé",
    phone: "55478952",
    adress: "Madrid, Espagne",
  ),
  const PharmacyModel(
    title: "Health First Pharmacy",
    speciality: "Produits pharmaceutiques et consultations",
    phone: "55123698",
    adress: "New York, USA",
  ),
  const PharmacyModel(
    title: "Pharmacie Al Amal",
    speciality: "Médicaments et produits naturels",
    phone: "55678941",
    adress: "Casablanca, Maroc",
  ),
];
