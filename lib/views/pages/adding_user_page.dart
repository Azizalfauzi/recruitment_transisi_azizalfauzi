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
          child: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                content(),
              ],
            ),
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
      child: BlocConsumer<CreateUserCubit, CreateUserState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            Flushbar(
              duration: const Duration(milliseconds: 3000),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Colors.green,
              titleText: Text(
                'Success Create',
                style: whiteTextStyleInter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              messageText: Text(
                'Berhasil create user baru',
                style: whiteTextStyleInter.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ).show(context);
            // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
            context.read<RoutesCubit>().emit(RoutesHome());
            nameController.text = "";
            jobController.text = "";
          } else if (state is CreateUserFailed) {
            Flushbar(
              duration: const Duration(milliseconds: 3000),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Colors.red,
              titleText: Text(
                'Gagal create user',
                style: whiteTextStyleInter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              messageText: Text(
                state.message,
                style: whiteTextStyleInter.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is CreateUserLoading) {
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.blue[900],
                size: 50,
              ),
            );
          }
          return ElevatedButton(
            style: style,
            onPressed: () async {
              if (nameController.text == "" || jobController.text == "") {
                Flushbar(
                  duration: const Duration(milliseconds: 3000),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.red,
                  titleText: Text(
                    'Ada form kosong!',
                    style: whiteTextStyleInter.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  messageText: Text(
                    'Lakukan pengisian form dengan benar',
                    style: whiteTextStyleInter.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ).show(context);
              } else {
                context
                    .read<CreateUserCubit>()
                    .createUser(nameController.text, jobController.text);
              }
            },
            child: Text(
              'Add User',
              style: whiteTextStyleInter.copyWith(
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
