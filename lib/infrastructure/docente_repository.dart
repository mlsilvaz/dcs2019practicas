import 'package:upg_fisi/infrastructure/database_provider.dart';
import 'package:upg_fisi/model/docente.dart';

abstract class DocenteRepository {
  DatabaseProvider databaseProvider;
  Future<int> insert(Docente docente);
  Future<int> update(Docente docente);
  Future<int> delete(Docente docente);
  Future<List<Docente>> getList();
}