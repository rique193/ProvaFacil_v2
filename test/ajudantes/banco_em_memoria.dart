import 'package:drift/native.dart';
import 'package:provafacil/data/local/app_database.dart';

AppDatabase criarBancoEmMemoria() => AppDatabase(NativeDatabase.memory());
