import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../user/domain/entities/user_entity.dart';
import '../../../domain/entities/room_entity.dart';

part 'create_group_state.freezed.dart';

@freezed
class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState({
    @Default(false) bool isSearching,
    @Default([]) List<PartialUserEntity> searchResults,
    // id -> entity, чтобы отображать выбранных даже когда их не видно в текущей выдаче поиска
    @Default({}) Map<String, PartialUserEntity> selectedUsers,
    String? searchErrorMessage,
    @Default(false) bool isCreating,
    String? createErrorMessage,
    RoomEntity? createdRoom,
  }) = _CreateGroupState;
}