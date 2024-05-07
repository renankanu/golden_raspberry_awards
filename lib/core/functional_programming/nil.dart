// Nil representa o null
// Isso força o programador a lidar explicitamente com a possibilidade de falta de valor, evitando assim erros comuns de referência nula.
// TODO - Implementar o tipo Nil
final class Nil {
  @override
  String toString() => 'Nil{}';
}

Nil get nil => Nil();
