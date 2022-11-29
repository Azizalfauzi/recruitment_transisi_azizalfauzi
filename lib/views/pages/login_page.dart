part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
      ),
    );
  }

  Widget header() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MyUtility(context).height / 50,
              bottom: MyUtility(context).height / 50,
            ),
            height: MyUtility(context).height / 7,
            width: MyUtility(context).width / 5,
            child: const FlutterLogo(),
          ),
          Text(
            'PT.Transisi Mandiri',
            style: blackTextStyleInter.copyWith(
              fontSize: 22,
              fontWeight: bold,
              color: Colors.blue.shade900,
            ),
          ),
          Text(
            'Login',
            style: blackTextStyleInter.copyWith(
              fontSize: 20,
              fontWeight: medium,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return SizedBox(
      height: MyUtility(context).height / 2.0,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: blackTextStyleInter.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                      color: Colors.blue[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Type your email here',
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
                  'Password',
                  style: blackTextStyleInter.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                      color: Colors.blue[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Type your password here',
                    hintStyle: blackTextStyleInter.copyWith(
                      fontSize: 15,
                      fontWeight: light,
                      color: Colors.grey,
                    ),
                    suffix: InkWell(
                      onTap: _toggle,
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 15.0,
                        color: kPrimaryGreyColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height / 20,
                ),
                footer(),
              ],
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
          'Login',
          style: whiteTextStyleInter.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
