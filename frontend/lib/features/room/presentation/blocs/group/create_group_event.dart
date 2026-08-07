import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../user/domain/entities/user_entity.dart';

part 'create_group_event.freezed.dart';

@freezed
class CreateGroupEvent with _$CreateGroupEvent {
  // изменение поискового запроса
  const factory CreateGroupEvent.queryChanged(String query) = QueryChanged;
  // выбор пользователя в группу
  const factory CreateGroupEvent.userToggled(PartialUserEntity user) = UserToggled;
  // запрос на создание группы
  const factory CreateGroupEvent.createRequested(String name) = CreateRequested;
}