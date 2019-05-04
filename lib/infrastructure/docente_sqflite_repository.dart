import 'package:upg_fisi/infrastructure/docente_dao.dart';
import 'package:upg_fisi/infrastructure/docente_repository.dart';
import 'package:upg_fisi/infrastructure/database_provider.dart';
import 'package:upg_fisi/model/docente.dart';

class DocenteSqfliteRepository implements DocenteRepository {
  final dao = DocenteDao();

  @override
  DatabaseProvider databaseProvider;

  DocenteSqfliteRepository(this.databaseProvider);

  @override
  Future<int> insert(Docente docente) async {
    final db = await databaseProvider.db();
    var id = await db.insert(dao.tableName, dao.toMap(docente));
    return id;
  }

  @override
  Future<int> delete(Docente docente) async {
    final db = await databaseProvider.db();
    int result = await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [docente.id]);
    return result;
  }

  @override
  Future<int> update(Docente docente) async {
    final db = await databaseProvider.db();
    int result = await db.update(dao.tableName, dao.toMap(docente),
        where: dao.columnId + " = ?", whereArgs: [docente.id]);
    return result;
  }

  @override
  Future<List<Docente>> getList() async {
    final db = await databaseProvider.db();
    var result = await db.rawQuery("SELECT * FROM docentes order by name ASC");
    return dao.fromList(result);
  }
}