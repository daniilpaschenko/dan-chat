import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../user/domain/entities/user_entity.dart';
import '../../../domain/entities/room_entity.dart';

part 'add_participants_state.freezed.dart';

@freezed
class AddParticipantsState with _$AddParticipantsState {
  const factory AddParticipantsState({
    @Default(false) bool isSearching,
    @Default([]) List<PartialUserEntity> searchResults,
    @Default({}) Map<String, PartialUserEntity> selectedUsers,
    String? searchErrorMessage,
    @Default(false) bool isSubmitting,
    String? submitErrorMessage,
    RoomEntity? updatedRoom, // одноразовый сигнал успешного добавления
  }) = _AddParticipantsState;
}