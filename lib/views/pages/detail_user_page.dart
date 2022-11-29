part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        context.read<RoutesCubit>().emit(RoutesHome());
        return false;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            content(),
            content(),
          ],
        ),
      ),
    );
  }

  Widget header() {
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
              IconButton(
                iconSize:  MyUtility(context).height / 10,
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              Text(
                'Nama User',
                style: whiteTextStyleInter.copyWith(
                    fontSize: 20, fontWeight: regular),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.phone, color: Color(0xff3F51B5)),
        title: Text('Hello World ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Icon(Icons.message),
      ),
    );
  }
}
