import 'package:upg_fisi/infrastructure/dao.dart';
import 'package:upg_fisi/model/docente.dart';

class DocenteDao implements Dao<Docente> {
  final tableName = 'docentes';
  final columnId = 'id';
  final _columnName = 'namedocente';
  
  @override
  String get createTableQuery =>
    "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $_columnName TEXT)";

  @override
  Docente fromMap(Map<String, dynamic> query) {
    Docente docente = Docente( query[_columnName]);
    return docente;
  }

  @override
  Map<String, dynamic> toMap(Docente docente) {
    return <String, dynamic>{
      _columnName: docente.namedocente
   };
  }

  Docente fromDbRow(dynamic row) {
    return Docente.withId(row[columnId], row[_columnName]);
  }

  @override
  List<Docente> fromList(result) {
    List<Docente> docentes = List<Docente>();
    var count = result.length;
    for (int i = 0; i < count; i++) {
      docentes.add(fromDbRow(result[i]));
    }
    return docentes;
  }
}
