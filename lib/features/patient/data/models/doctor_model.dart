
class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String avatarUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.avatarUrl,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      avatarUrl: json['avatarUrl'] as String,
    
    );
  }
  static List<Doctor> doctorsList() {
    return [
      Doctor(
        id: "d1",
        name: "Dr. Amina Khaled",
        specialty: "Cardiology",
        avatarUrl: "assets/images/doc1.png",
       
      ),
      Doctor(
        id: "d2",
        name: "Dr. Omar Hassan",
        specialty: "Dermatology",
        avatarUrl: "assets/images/doc2.png",
       
      ),
      Doctor(
        id: "d3",
        name: "Dr. Nour El-Din",
        specialty: "Pediatrics",
        avatarUrl: "assets/images/doc3.png",
       
      ),
    ];
  }
}
