class DoctorModel {
  final String? fullName;
  final String? speciality;
  final String? phone;
  final String? adress;
  final String? image;

  const DoctorModel({
    this.fullName,
    this.speciality,
    this.phone,
    this.adress,
    this.image,
  });
}

List<DoctorModel> listDoctors = [
  const DoctorModel(
    fullName: "John Doe",
    speciality: "Cardiologue",
    phone: "55789412",
    adress: "Rome, Italy",
    image: "assets/doctors/image1.jpg",
  ),
  const DoctorModel(
    fullName: "Anna Rossi",
    speciality: "Dermatologue",
    phone: "55871234",
    adress: "Milan, Italy",
    image: "assets/doctors/image7.png",
  ),
  const DoctorModel(
    fullName: "Michael Brown",
    speciality: "Pédiatre",
    phone: "55963214",
    adress: "New York, USA",
    image: "assets/doctors/image2.jpeg",
  ),
  const DoctorModel(
    fullName: "Sophie Dubois",
    speciality: "Neurologue",
    phone: "55478569",
    adress: "Paris, France",
    image: "assets/doctors/image8.png",
  ),
  const DoctorModel(
    fullName: "Liam O'Connor",
    speciality: "Orthopediste",
    phone: "55123478",
    adress: "Dublin, Ireland",
    image: "assets/doctors/image3.jpeg",
  ),
  const DoctorModel(
    fullName: "Fatima El Badr",
    speciality: "Gynecologue",
    phone: "55698412",
    adress: "Casablanca, Morocco",
    image: "assets/doctors/image4.jpeg",
  ),
  const DoctorModel(
    fullName: "Hiroshi Tanaka",
    speciality: "Ophtalmologue",
    phone: "55321487",
    adress: "Tokyo, Japan",
    image: "assets/doctors/image5.png",
  ),
  const DoctorModel(
    fullName: "Carlos Mendes",
    speciality: "Chirurgien",
    phone: "55784123",
    adress: "Lisbon, Portugal",
    image: "assets/doctors/image6.png",
  ),
];
