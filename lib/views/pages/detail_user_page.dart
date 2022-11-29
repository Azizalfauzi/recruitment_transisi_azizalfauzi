part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<GetUserCubit>().getUser(widget.id);
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        context.read<RoutesCubit>().emit(RoutesHome());
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<GetUserCubit, GetUserState>(
          builder: (context, state) {
            if (state is GetUserLoading) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue[900],
                  size: 50,
                ),
              );
            } else if (state is GetUserSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(state.result.firstName, state.result.avatar),
                  content(state.result.email),
                ],
              );
            } else {
              return const Center(
                child: Text('Data Kosong!'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget header(String firstname, String avatar) {
    return Container(
      width: double.infinity,
      height: MyUtility(context).height / 2.7,
      color: Colors.blue[900],
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MyUtility(context).height / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<RoutesCubit>().emit(RoutesHome());
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MyUtility(context).height / 10,
                width: MyUtility(context).height / 10,
                child: CircleAvatar(
                    backgroundColor: Colors.blue[900],
                    child: Image.network(avatar)),
              ),
              Text(
                firstname,
                style: whiteTextStyleInter.copyWith(
                    fontSize: 20, fontWeight: regular),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget content(String email) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.email, color: Color(0xff3F51B5)),
        title: Text(email),
        subtitle: const Text('E-mail'),
        trailing: const Icon(Icons.message),
      ),
    );
  }
}
