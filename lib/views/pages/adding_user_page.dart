part of 'pages.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<RoutesCubit>().emit(RoutesHome());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            onPressed: () {
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              context.read<RoutesCubit>().emit(RoutesHome());
            },
            icon: const Icon(Icons.cancel_sharp),
          ),
          title: Text(
            'Create User',
            style: whiteTextStyleInter,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            children: [
              header(),
              content(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return SizedBox(
      height: MyUtility(context).height / 5,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          height: MyUtility(context).height / 6,
          width: MyUtility(context).width / 4,
          child: CircleAvatar(
            backgroundColor: const Color(0xff3F51B5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return SizedBox(
      height: MyUtility(context).height / 1.8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: blackTextStyleInter.copyWith(
                  fontWeight: medium, fontSize: 16, color: Colors.blue[900]),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Type your name here',
                hintStyle: blackTextStyleInter.copyWith(
                  fontSize: 15,
                  fontWeight: light,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Job',
              style: blackTextStyleInter.copyWith(
                  fontWeight: medium, fontSize: 16, color: Colors.blue[900]),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Type your job here',
                hintStyle: blackTextStyleInter.copyWith(
                  fontSize: 15,
                  fontWeight: light,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            footer(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.blue[900],
      textStyle: whiteTextStyleInter.copyWith(
        fontWeight: medium,
      ),
    );
    return SizedBox(
      width: double.infinity,
      height: MyUtility(context).height / 15,
      child: ElevatedButton(
        style: style,
        onPressed: () {
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          context.read<RoutesCubit>().emit(RoutesHome());
        },
        child: Text(
          'Add User',
          style: whiteTextStyleInter.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
