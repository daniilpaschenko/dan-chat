// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_participants_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddParticipantsState {
  bool get isSearching => throw _privateConstructorUsedError;
  List<PartialUserEntity> get searchResults =>
      throw _privateConstructorUsedError;
  Map<String, PartialUserEntity> get selectedUsers =>
      throw _privateConstructorUsedError;
  String? get searchErrorMessage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get submitErrorMessage => throw _privateConstructorUsedError;
  RoomEntity? get updatedRoom => throw _privateConstructorUsedError;

  /// Create a copy of AddParticipantsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddParticipantsStateCopyWith<AddParticipantsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddParticipantsStateCopyWith<$Res> {
  factory $AddParticipantsStateCopyWith(
    AddParticipantsState value,
    $Res Function(AddParticipantsState) then,
  ) = _$AddParticipantsStateCopyWithImpl<$Res, AddParticipantsState>;
  @useResult
  $Res call({
    bool isSearching,
    List<PartialUserEntity> searchResults,
    Map<String, PartialUserEntity> selectedUsers,
    String? searchErrorMessage,
    bool isSubmitting,
    String? submitErrorMessage,
    RoomEntity? updatedRoom,
  });

  $RoomEntityCopyWith<$Res>? get updatedRoom;
}

/// @nodoc
class _$AddParticipantsStateCopyWithImpl<
  $Res,
  $Val extends AddParticipantsState
>
    implements $AddParticipantsStateCopyWith<$Res> {
  _$AddParticipantsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddParticipantsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? searchResults = null,
    Object? selectedUsers = null,
    Object? searchErrorMessage = freezed,
    Object? isSubmitting = null,
    Object? submitErrorMessage = freezed,
    Object? updatedRoom = freezed,
  }) {
    return _then(
      _value.copyWith(
            isSearching: null == isSearching
                ? _value.isSearching
                : isSearching // ignore: cast_nullable_to_non_nullable
                      as bool,
            searchResults: null == searchResults
                ? _value.searchResults
                : searchResults // ignore: cast_nullable_to_non_nullable
                      as List<PartialUserEntity>,
            selectedUsers: null == selectedUsers
                ? _value.selectedUsers
                : selectedUsers // ignore: cast_nullable_to_non_nullable
                      as Map<String, PartialUserEntity>,
            searchErrorMessage: freezed == searchErrorMessage
                ? _value.searchErrorMessage
                : searchErrorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            submitErrorMessage: freezed == submitErrorMessage
                ? _value.submitErrorMessage
                : submitErrorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedRoom: freezed == updatedRoom
                ? _value.updatedRoom
                : updatedRoom // ignore: cast_nullable_to_non_nullable
                      as RoomEntity?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddParticipantsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res>? get updatedRoom {
    if (_value.updatedRoom == null) {
      return null;
    }

    return $RoomEntityCopyWith<$Res>(_value.updatedRoom!, (value) {
      return _then(_value.copyWith(updatedRoom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddParticipantsStateImplCopyWith<$Res>
    implements $AddParticipantsStateCopyWith<$Res> {
  factory _$$AddParticipantsStateImplCopyWith(
    _$AddParticipantsStateImpl value,
    $Res Function(_$AddParticipantsStateImpl) then,
  ) = __$$AddParticipantsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isSearching,
    List<PartialUserEntity> searchResults,
    Map<String, PartialUserEntity> selectedUsers,
    String? searchErrorMessage,
    bool isSubmitting,
    String? submitErrorMessage,
    RoomEntity? updatedRoom,
  });

  @override
  $RoomEntityCopyWith<$Res>? get updatedRoom;
}

/// @nodoc
class __$$AddParticipantsStateImplCopyWithImpl<$Res>
    extends _$AddParticipantsStateCopyWithImpl<$Res, _$AddParticipantsStateImpl>
    implements _$$AddParticipantsStateImplCopyWith<$Res> {
  __$$AddParticipantsStateImplCopyWithImpl(
    _$AddParticipantsStateImpl _value,
    $Res Function(_$AddParticipantsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddParticipantsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? searchResults = null,
    Object? selectedUsers = null,
    Object? searchErrorMessage = freezed,
    Object? isSubmitting = null,
    Object? submitErrorMessage = freezed,
    Object? updatedRoom = freezed,
  }) {
    return _then(
      _$AddParticipantsStateImpl(
        isSearching: null == isSearching
            ? _value.isSearching
            : isSearching // ignore: cast_nullable_to_non_nullable
                  as bool,
        searchResults: null == searchResults
            ? _value._searchResults
            : searchResults // ignore: cast_nullable_to_non_nullable
                  as List<PartialUserEntity>,
        selectedUsers: null == selectedUsers
            ? _value._selectedUsers
            : selectedUsers // ignore: cast_nullable_to_non_nullable
                  as Map<String, PartialUserEntity>,
        searchErrorMessage: freezed == searchErrorMessage
            ? _value.searchErrorMessage
            : searchErrorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        submitErrorMessage: freezed == submitErrorMessage
            ? _value.submitErrorMessage
            : submitErrorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedRoom: freezed == updatedRoom
            ? _value.updatedRoom
            : updatedRoom // ignore: cast_nullable_to_non_nullable
                  as RoomEntity?,
      ),
    );
  }
}

/// @nodoc

class _$AddParticipantsStateImpl implements _AddParticipantsState {
  const _$AddParticipantsStateImpl({
    this.isSearching = false,
    final List<PartialUserEntity> searchResults = const [],
    final Map<String, PartialUserEntity> selectedUsers = const {},
    this.searchErrorMessage,
    this.isSubmitting = false,
    this.submitErrorMessage,
    this.updatedRoom,
  }) : _searchResults = searchResults,
       _selectedUsers = selectedUsers;

  @override
  @JsonKey()
  final bool isSearching;
  final List<PartialUserEntity> _searchResults;
  @override
  @JsonKey()
  List<PartialUserEntity> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  final Map<String, PartialUserEntity> _selectedUsers;
  @override
  @JsonKey()
  Map<String, PartialUserEntity> get selectedUsers {
    if (_selectedUsers is EqualUnmodifiableMapView) return _selectedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedUsers);
  }

  @override
  final String? searchErrorMessage;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? submitErrorMessage;
  @override
  final RoomEntity? updatedRoom;

  @override
  String toString() {
    return 'AddParticipantsState(isSearching: $isSearching, searchResults: $searchResults, selectedUsers: $selectedUsers, searchErrorMessage: $searchErrorMessage, isSubmitting: $isSubmitting, submitErrorMessage: $submitErrorMessage, updatedRoom: $updatedRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddParticipantsStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality().equals(
              other._searchResults,
              _searchResults,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedUsers,
              _selectedUsers,
            ) &&
            (identical(other.searchErrorMessage, searchErrorMessage) ||
                other.searchErrorMessage == searchErrorMessage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.submitErrorMessage, submitErrorMessage) ||
                other.submitErrorMessage == submitErrorMessage) &&
            (identical(other.updatedRoom, updatedRoom) ||
                other.updatedRoom == updatedRoom));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isSearching,
    const DeepCollectionEquality().hash(_searchResults),
    const DeepCollectionEquality().hash(_selectedUsers),
    searchErrorMessage,
    isSubmitting,
    submitErrorMessage,
    updatedRoom,
  );

  /// Create a copy of AddParticipantsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddParticipantsStateImplCopyWith<_$AddParticipantsStateImpl>
  get copyWith =>
      __$$AddParticipantsStateImplCopyWithImpl<_$AddParticipantsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AddParticipantsState implements AddParticipantsState {
  const factory _AddParticipantsState({
    final bool isSearching,
    final List<PartialUserEntity> searchResults,
    final Map<String, PartialUserEntity> selectedUsers,
    final String? searchErrorMessage,
    final bool isSubmitting,
    final String? submitErrorMessage,
    final RoomEntity? updatedRoom,
  }) = _$AddParticipantsStateImpl;

  @override
  bool get isSearching;
  @override
  List<PartialUserEntity> get searchResults;
  @override
  Map<String, PartialUserEntity> get selectedUsers;
  @override
  String? get searchErrorMessage;
  @override
  bool get isSubmitting;
  @override
  String? get submitErrorMessage;
  @override
  RoomEntity? get updatedRoom;

  /// Create a copy of AddParticipantsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddParticipantsStateImplCopyWith<_$AddParticipantsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
