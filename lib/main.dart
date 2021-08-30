
import 'package:flooorexample/personmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.g.dart';
import 'listview.dart';



void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floor"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(
                    hintText: "Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                    hintText: "Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  addUserDetail(
                      Person(int.tryParse(idController.text), nameController.text, ageController.text));
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.indigo,
              ),
              SizedBox(
                height: 10,
              ),
             /* FutureBuilder(
                  future: getUserList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Person>> snapshot) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Card(
                                      child: Text(snapshot.data![index].name),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    );
                  })*/
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListForm()));
        },
      ),
    );
  }

  void addUserDetail(Person person) async {
    final database =
        await $FloorAppDataBase.databaseBuilder('person_database.db').build();
    final userDao = database.personDao;
    await userDao.insertPerson(person);
  }

  /*Future<List<Person>> getUserList() async {
    final database =
        await $FloorAppDataBase.databaseBuilder('floor_database.db').build();
    final userDao = database.personDao;
    return await userDao.findAllPersons();
  }*/
}
