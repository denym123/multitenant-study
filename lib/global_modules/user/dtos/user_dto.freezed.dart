// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDto {

 int? get id; String? get username; PersonDto? get person; List<String>? get roles; List<String>? get permissions; bool? get hasFiliation;
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDtoCopyWith<UserDto> get copyWith => _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.person, person) || other.person == person)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.hasFiliation, hasFiliation) || other.hasFiliation == hasFiliation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,person,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(permissions),hasFiliation);

@override
String toString() {
  return 'UserDto(id: $id, username: $username, person: $person, roles: $roles, permissions: $permissions, hasFiliation: $hasFiliation)';
}


}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res>  {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) = _$UserDtoCopyWithImpl;
@useResult
$Res call({
 int? id, String? username, PersonDto? person, List<String>? roles, List<String>? permissions, bool? hasFiliation
});


$PersonDtoCopyWith<$Res>? get person;

}
/// @nodoc
class _$UserDtoCopyWithImpl<$Res>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? username = freezed,Object? person = freezed,Object? roles = freezed,Object? permissions = freezed,Object? hasFiliation = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as PersonDto?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>?,hasFiliation: freezed == hasFiliation ? _self.hasFiliation : hasFiliation // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonDtoCopyWith<$Res>? get person {
    if (_self.person == null) {
    return null;
  }

  return $PersonDtoCopyWith<$Res>(_self.person!, (value) {
    return _then(_self.copyWith(person: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDto].
extension UserDtoPatterns on UserDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDto value)  $default,){
final _that = this;
switch (_that) {
case _UserDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? username,  PersonDto? person,  List<String>? roles,  List<String>? permissions,  bool? hasFiliation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.username,_that.person,_that.roles,_that.permissions,_that.hasFiliation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? username,  PersonDto? person,  List<String>? roles,  List<String>? permissions,  bool? hasFiliation)  $default,) {final _that = this;
switch (_that) {
case _UserDto():
return $default(_that.id,_that.username,_that.person,_that.roles,_that.permissions,_that.hasFiliation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? username,  PersonDto? person,  List<String>? roles,  List<String>? permissions,  bool? hasFiliation)?  $default,) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.username,_that.person,_that.roles,_that.permissions,_that.hasFiliation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDto implements UserDto {
  const _UserDto({this.id, this.username, this.person, final  List<String>? roles, final  List<String>? permissions, this.hasFiliation}): _roles = roles,_permissions = permissions;
  factory _UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

@override final  int? id;
@override final  String? username;
@override final  PersonDto? person;
 final  List<String>? _roles;
@override List<String>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _permissions;
@override List<String>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? hasFiliation;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDtoCopyWith<_UserDto> get copyWith => __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.person, person) || other.person == person)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.hasFiliation, hasFiliation) || other.hasFiliation == hasFiliation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,person,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_permissions),hasFiliation);

@override
String toString() {
  return 'UserDto(id: $id, username: $username, person: $person, roles: $roles, permissions: $permissions, hasFiliation: $hasFiliation)';
}


}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) = __$UserDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? username, PersonDto? person, List<String>? roles, List<String>? permissions, bool? hasFiliation
});


@override $PersonDtoCopyWith<$Res>? get person;

}
/// @nodoc
class __$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? username = freezed,Object? person = freezed,Object? roles = freezed,Object? permissions = freezed,Object? hasFiliation = freezed,}) {
  return _then(_UserDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as PersonDto?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>?,hasFiliation: freezed == hasFiliation ? _self.hasFiliation : hasFiliation // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonDtoCopyWith<$Res>? get person {
    if (_self.person == null) {
    return null;
  }

  return $PersonDtoCopyWith<$Res>(_self.person!, (value) {
    return _then(_self.copyWith(person: value));
  });
}
}

// dart format on
