class Speciality implements Comparable<Speciality> {
  final String speciality;
  final List<String> cities, doctors;
  final String image;

  const Speciality(this.speciality, this.cities, this.doctors, this.image);

  @override
  int compareTo(Speciality other) => speciality.compareTo(other.speciality);
}
