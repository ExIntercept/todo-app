import 'package:hive/hive.dart';
import 'package:projnew/todo.dart';

class Boxes {
  static Box<Todo> getBox() => Hive.box<Todo>("myBox");
}
