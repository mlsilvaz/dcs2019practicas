class Docente {
  int _id;
  String _namedocente;

  Docente([this._namedocente]);
  Docente.withId(this._id, [this._namedocente]);
  int get id => _id;
  String get namedocente => _namedocente;

 set namedocente (String ) {
    _namedocente = namedocente;
 }
  

}

