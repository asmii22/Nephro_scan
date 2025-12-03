import 'package:injectable/injectable.dart';

import '../../domain/repositories/message_repository.dart';
import '../datasources/message_remote_datasource.dart';

@LazySingleton(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});
}
