import 'package:byte_bank_oficial/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank02.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.tableSQL);
    },
    version: 1,
  );
}
