part of 'models.dart';

class DummyListUser {
  final int id;
  final String name;
  final String noTelp;

  DummyListUser(this.id, this.name, this.noTelp);
}

List<DummyListUser> mockUser = [
  DummyListUser(1, "Aziz Alfauzi", "082334967"),
  DummyListUser(2, "John Doe", "082334505"),
  DummyListUser(3, "Adam levine", "082334479"),
];
