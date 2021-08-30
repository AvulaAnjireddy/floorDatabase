import 'package:flooorexample/personmodel.dart';
import 'package:flutter/material.dart';
import 'database.g.dart';


class ListForm extends StatefulWidget {
  const ListForm({Key key}) : super(key: key);

  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("ListView")),
      body: Container(
        child: Column(children: [
          FutureBuilder(
              future: getUserList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Person>> snapshot) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(child: Text(snapshot.data[index].name)),
                        );
                      }),
                );
              })
        ],),
      ),
    );
  }
  Future<List<Person>> getUserList() async {
    final database =
    await $FloorAppDataBase.databaseBuilder('person_database.db').build();
    final userDao = database.personDao;
    return await userDao.findAllPersons();

  }
}
