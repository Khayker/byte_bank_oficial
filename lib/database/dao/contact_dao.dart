import 'package:byte_bank_oficial/database/app_database.dart';
import 'package:byte_bank_oficial/models/contact.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactDAO {
  static const String _tabblename = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tableSQL = 'CREATE TABLE $_tabblename('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tabblename, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};
    //contactMap['id'] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    List<Contact> contactsList = await _toList(db);
    return contactsList;
  }

  Future<List<Contact>> _toList(Database db) async {
    final List<Contact> contactsList = [];
    for (Map<String, dynamic> row in await db.query(_tabblename)) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contactsList.add(contact);
    }
    return contactsList;
  }
}
