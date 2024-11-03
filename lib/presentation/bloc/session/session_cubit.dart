import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/hive_storage_manager.dart';

class SessionCubit extends Cubit {

  final HiveStorageManager _storageManager;

  SessionCubit(this._storageManager) : super(null);

  void clearUserSession() {
    _storageManager.auth = null;
  }
}
