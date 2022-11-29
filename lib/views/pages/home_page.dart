part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Contacts',
          style: whiteTextStyleInter,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              context.read<RoutesCubit>().emit(const RoutesDetail("1"));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          WidgetListUser(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RoutesCubit>().emit(RoutesCreate());
        },
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.add),
      ),
    );
  }
}
