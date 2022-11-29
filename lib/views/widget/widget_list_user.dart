part of 'widget.dart';

class WidgetListUser extends StatelessWidget {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  const WidgetListUser({
    Key? key,
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<RoutesCubit>().emit(RoutesDetail(id));
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.blue[900], child: Image.network(avatar)),
          title: Text(firstname + lastname),
          subtitle: Text(email),
          trailing: const Icon(Icons.star),
        ),
      ),
    );
  }
}
