// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreateGroupState {
  bool get isSearching => throw _privateConstructorUsedError;
  List<PartialUserEntity> get searchResults =>
      throw _privateConstructorUsedError; // id -> entity, чтобы отображать выбранных даже когда их не видно в текущей выдаче поиска
  Map<String, PartialUserEntity> get selectedUsers =>
      throw _privateConstructorUsedError;
  String? get searchErrorMessage => throw _privateConstructorUsedError;
  bool get isCreating => throw _privateConstructorUsedError;
  String? get createErrorMessage => throw _privateConstructorUsedError;
  RoomEntity? get createdRoom => throw _privateConstructorUsedError;

  /// Create a copy of CreateGroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateGroupStateCopyWith<CreateGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupStateCopyWith<$Res> {
  factory $CreateGroupStateCopyWith(
    CreateGroupState value,
    $Res Function(CreateGroupState) then,
  ) = _$CreateGroupStateCopyWithImpl<$Res, CreateGroupState>;
  @useResult
  $Res call({
    bool isSearching,
    List<PartialUserEntity> searchResults,
    Map<String, PartialUserEntity> selectedUsers,
    String? searchErrorMessage,
    bool isCreating,
    String? createErrorMessage,
    RoomEntity? createdRoom,
  });

  $RoomEntityCopyWith<$Res>? get createdRoom;
}

/// @nodoc
class _$CreateGroupStateCopyWithImpl<$Res, $Val extends CreateGroupState>
    implements $CreateGroupStateCopyWith<$Res> {
  _$CreateGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateGroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? searchResults = null,
    Object? selectedUsers = null,
    Object? searchErrorMessage = freezed,
    Object? isCreating = null,
    Object? createErrorMessage = freezed,
    Object? createdRoom = freezed,
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
            isCreating: null == isCreating
                ? _value.isCreating
                : isCreating // ignore: cast_nullable_to_non_nullable
                      as bool,
            createErrorMessage: freezed == createErrorMessage
                ? _value.createErrorMessage
                : createErrorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdRoom: freezed == createdRoom
                ? _value.createdRoom
                : createdRoom // ignore: cast_nullable_to_non_nullable
                      as RoomEntity?,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateGroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res>? get createdRoom {
    if (_value.createdRoom == null) {
      return null;
    }

    return $RoomEntityCopyWith<$Res>(_value.createdRoom!, (value) {
      return _then(_value.copyWith(createdRoom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateGroupStateImplCopyWith<$Res>
    implements $CreateGroupStateCopyWith<$Res> {
  factory _$$CreateGroupStateImplCopyWith(
    _$CreateGroupStateImpl value,
    $Res Function(_$CreateGroupStateImpl) then,
  ) = __$$CreateGroupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isSearching,
    List<PartialUserEntity> searchResults,
    Map<String, PartialUserEntity> selectedUsers,
    String? searchErrorMessage,
    bool isCreating,
    String? createErrorMessage,
    RoomEntity? createdRoom,
  });

  @override
  $RoomEntityCopyWith<$Res>? get createdRoom;
}

/// @nodoc
class __$$CreateGroupStateImplCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateImpl>
    implements _$$CreateGroupStateImplCopyWith<$Res> {
  __$$CreateGroupStateImplCopyWithImpl(
    _$CreateGroupStateImpl _value,
    $Res Function(_$CreateGroupStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateGroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? searchResults = null,
    Object? selectedUsers = null,
    Object? searchErrorMessage = freezed,
    Object? isCreating = null,
    Object? createErrorMessage = freezed,
    Object? createdRoom = freezed,
  }) {
    return _then(
      _$CreateGroupStateImpl(
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
        isCreating: null == isCreating
            ? _value.isCreating
            : isCreating // ignore: cast_nullable_to_non_nullable
                  as bool,
        createErrorMessage: freezed == createErrorMessage
            ? _value.createErrorMessage
            : createErrorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdRoom: freezed == createdRoom
            ? _value.createdRoom
            : createdRoom // ignore: cast_nullable_to_non_nullable
                  as RoomEntity?,
      ),
    );
  }
}

/// @nodoc

class _$CreateGroupStateImpl implements _CreateGroupState {
  const _$CreateGroupStateImpl({
    this.isSearching = false,
    final List<PartialUserEntity> searchResults = const [],
    final Map<String, PartialUserEntity> selectedUsers = const {},
    this.searchErrorMessage,
    this.isCreating = false,
    this.createErrorMessage,
    this.createdRoom,
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

  // id -> entity, чтобы отображать выбранных даже когда их не видно в текущей выдаче поиска
  final Map<String, PartialUserEntity> _selectedUsers;
  // id -> entity, чтобы отображать выбранных даже когда их не видно в текущей выдаче поиска
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
  final bool isCreating;
  @override
  final String? createErrorMessage;
  @override
  final RoomEntity? createdRoom;

  @override
  String toString() {
    return 'CreateGroupState(isSearching: $isSearching, searchResults: $searchResults, selectedUsers: $selectedUsers, searchErrorMessage: $searchErrorMessage, isCreating: $isCreating, createErrorMessage: $createErrorMessage, createdRoom: $createdRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupStateImpl &&
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
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.createErrorMessage, createErrorMessage) ||
                other.createErrorMessage == createErrorMessage) &&
            (identical(other.createdRoom, createdRoom) ||
                other.createdRoom == createdRoom));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isSearching,
    const DeepCollectionEquality().hash(_searchResults),
    const DeepCollectionEquality().hash(_selectedUsers),
    searchErrorMessage,
    isCreating,
    createErrorMessage,
    createdRoom,
  );

  /// Create a copy of CreateGroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupStateImplCopyWith<_$CreateGroupStateImpl> get copyWith =>
      __$$CreateGroupStateImplCopyWithImpl<_$CreateGroupStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CreateGroupState implements CreateGroupState {
  const factory _CreateGroupState({
    final bool isSearching,
    final List<PartialUserEntity> searchResults,
    final Map<String, PartialUserEntity> selectedUsers,
    final String? searchErrorMessage,
    final bool isCreating,
    final String? createErrorMessage,
    final RoomEntity? createdRoom,
  }) = _$CreateGroupStateImpl;

  @override
  bool get isSearching;
  @override
  List<PartialUserEntity> get searchResults; // id -> entity, чтобы отображать выбранных даже когда их не видно в текущей выдаче поиска
  @override
  Map<String, PartialUserEntity> get selectedUsers;
  @override
  String? get searchErrorMessage;
  @override
  bool get isCreating;
  @override
  String? get createErrorMessage;
  @override
  RoomEntity? get createdRoom;

  /// Create a copy of CreateGroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateGroupStateImplCopyWith<_$CreateGroupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
