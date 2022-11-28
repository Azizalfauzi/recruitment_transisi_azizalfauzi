part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          header(),
          content(),
          footer(),
        ],
      ),
    );
  }

  Widget header() {
    return Container();
  }

  Widget content() {
    return Container();
  }

  Widget footer() {
    return Container();
  }
}
