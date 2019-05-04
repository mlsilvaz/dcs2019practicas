import 'package:flutter/material.dart';
import 'package:upg_fisi/infrastructure/docente_sqflite_repository.dart';
import 'package:upg_fisi/infrastructure/database_provider.dart';
import 'package:upg_fisi/model/docente.dart';
import 'package:upg_fisi/screens/docente_detail.dart';

class DocentesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DocenteListState();
}

class DocenteState extends State<CourseList> {
  CourseSqfliteRepository courseRepository = CourseSqfliteRepository(DatabaseProvider.get);
  List<Docente> docentes;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (docentes == null) {
      docentes = List<Docente>();
      getData();
    }
    return Scaffold(
      body: docenteListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          navigateToDetail(Docente('', 1, 4, ''));
        }
        ,
        tooltip: "Add new Docente",
        child: new Icon(Icons.add),
      ),
    );
  }
  
  ListView docenteListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(this.docentes[position].semester),
              child:Text(this.docentes[position].semester.toString()),
            ),
          title: Text(this.docentes[position].name),
          subtitle: Text(this.docentes[position].credits.toString()),
          onTap: () {
            debugPrint("Tapped on " + this.docentes[position].id.toString());
            navigateToDetail(this.docentes[position]);
          },
          ),
        );
      },
    );
  }
  
  void getData() {    
      final docentesFuture = docenteeRepository.getList();
      docentesFuture.then((docenteList) {
        setState(() {
          docentes = docenteList;
          count = docenteList.length;
        });
        debugPrint("Items " + count.toString());
      });
  }

  Color getColor(int semester) {
    switch (semester) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.yellow;
        break;
      case 4:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  void navigateToDetail(Docente docente) async {
    bool result = await Navigator.push(context, 
        MaterialPageRoute(builder: (context) => DocenteDetail(docente)),
    );
    if (result == true) {
      getData();
    }
  }
}
