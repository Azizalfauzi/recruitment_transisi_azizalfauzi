part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ListUserCubit>().getUserList();
    return super.initState();
  }

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
              context.read<LoginCubit>().logout();
              context.read<RoutesCubit>().emit(RoutesLogin());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: BlocBuilder<ListUserCubit, ListUserState>(
          builder: (context, state) {
            if (state is ListUserLoading) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue[900],
                  size: 50,
                ),
              );
            } else if (state is ListUserGetSuccess) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: state.result
                    .map((e) => WidgetListUser(
                          id: e.id,
                          firstname: e.firstName,
                          lastname: e.lastName,
                          email: e.email,
                          avatar: e.avatar,
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: Text('Data Kosong!'),
              );
            }
          },
        ),
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
