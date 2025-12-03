import 'package:injectable/injectable.dart';

import '../../../../core/firebase_client/authorized_firebase_client.dart';

abstract class MessageRemoteDataSource {}

@LazySingleton(as: MessageRemoteDataSource)
class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final AuthorizedFirebaseClient _authorizedFirebaseClient;
  MessageRemoteDataSourceImpl(this._authorizedFirebaseClient);
}
