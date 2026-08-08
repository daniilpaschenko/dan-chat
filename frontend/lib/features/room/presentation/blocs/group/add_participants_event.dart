import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../user/domain/entities/user_entity.dart';

part 'add_participants_event.freezed.dart';

@freezed
class AddParticipantsEvent with _$AddParticipantsEvent {
  const factory AddParticipantsEvent.queryChanged(String query) = AddParticipantsQueryChanged;
  const factory AddParticipantsEvent.userToggled(PartialUserEntity user) = AddParticipantsUserToggled;
  const factory AddParticipantsEvent.submitRequested() = AddParticipantsSubmitRequested;
}