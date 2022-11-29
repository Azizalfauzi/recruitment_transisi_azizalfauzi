part of 'widget.dart';

class WidgetListUser extends StatelessWidget {
  const WidgetListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff3F51B5),
          child: Text('A'),
        ),
        title: Text('Hello World ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Icon(Icons.star),
      ),
    );
  }
}
