class PatientModel {
  final int? id;
  final String? fullName;
  final String? profileImage;
  final String? age;
  final String? gender;
  final String? idCard;
  final String? phoneNumber;
  final String? address;
  final String? socialCoverage;
  final String? profession;

  const PatientModel({
    this.id,
    this.fullName,
    this.age,
    this.profileImage,
    this.gender,
    this.idCard,
    this.phoneNumber,
    this.address,
    this.socialCoverage,
    this.profession,
  });
}

List<PatientModel> listPatients = [
  const PatientModel(
    id: 1,
    fullName: "John Doe",
    profileImage: "assets/profil/image1.jpg",
    gender: "Male",
    age: "23 years ",
    idCard: "345678",
    phoneNumber: "123456789",
    address: "123 Elm Street, New York",
    socialCoverage: "Full",
    profession: "Engineer",
  ),
  const PatientModel(
    id: 2,
    fullName: "Jane Smith",
    profileImage: "assets/profil/image5.png",
    gender: "Female",
    age: "45 years",
    idCard: "654321",
    phoneNumber: "987654321",
    address: "456 Maple Avenue, California",
    socialCoverage: "Partial",
    profession: "Teacher",
  ),
  const PatientModel(
    id: 3,
    fullName: "Michael Johnson",
    profileImage: "assets/profil/image3.png",
    gender: "Male",
    age: "44 years",
    idCard: "56789",
    phoneNumber: "456123789",
    address: "789 Pine Street, Texas",
    socialCoverage: "No",
    profession: "Doctor",
  ),
  const PatientModel(
    id: 4,
    fullName: "Emily Clark",
    profileImage: "assets/profil/image4.png",
    gender: "Female",
    age: "18 years",
    idCard: "67890",
    phoneNumber: "321654987",
    address: "321 Oak Avenue, Florida",
    socialCoverage: "Full",
    profession: "Nurse",
  ),
  const PatientModel(
    id: 5,
    fullName: "Chris Lee",
    profileImage: "assets/profil/image2.png",
    gender: "Male",
    age: "36 years",
    idCard: "078901",
    phoneNumber: "159357246",
    address: "987 Cedar Road, Chicago",
    socialCoverage: "No",
    profession: "Architect",
  ),
];
