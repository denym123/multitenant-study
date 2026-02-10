// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Person {

 int? get id; String? get name; String? get email; String? get cpf; String? get birthday; String? get phone; String? get avatarImage;
/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonCopyWith<Person> get copyWith => _$PersonCopyWithImpl<Person>(this as Person, _$identity);

  /// Serializes this Person to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Person&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.cpf, cpf) || other.cpf == cpf)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarImage, avatarImage) || other.avatarImage == avatarImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,cpf,birthday,phone,avatarImage);

@override
String toString() {
  return 'Person(id: $id, name: $name, email: $email, cpf: $cpf, birthday: $birthday, phone: $phone, avatarImage: $avatarImage)';
}


}

/// @nodoc
abstract mixin class $PersonCopyWith<$Res>  {
  factory $PersonCopyWith(Person value, $Res Function(Person) _then) = _$PersonCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? email, String? cpf, String? birthday, String? phone, String? avatarImage
});




}
/// @nodoc
class _$PersonCopyWithImpl<$Res>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._self, this._then);

  final Person _self;
  final $Res Function(Person) _then;

/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? cpf = freezed,Object? birthday = freezed,Object? phone = freezed,Object? avatarImage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,cpf: freezed == cpf ? _self.cpf : cpf // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,avatarImage: freezed == avatarImage ? _self.avatarImage : avatarImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Person].
extension PersonPatterns on Person {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Person value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Person() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Person value)  $default,){
final _that = this;
switch (_that) {
case _Person():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Person value)?  $default,){
final _that = this;
switch (_that) {
case _Person() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? email,  String? cpf,  String? birthday,  String? phone,  String? avatarImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Person() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.cpf,_that.birthday,_that.phone,_that.avatarImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? email,  String? cpf,  String? birthday,  String? phone,  String? avatarImage)  $default,) {final _that = this;
switch (_that) {
case _Person():
return $default(_that.id,_that.name,_that.email,_that.cpf,_that.birthday,_that.phone,_that.avatarImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? email,  String? cpf,  String? birthday,  String? phone,  String? avatarImage)?  $default,) {final _that = this;
switch (_that) {
case _Person() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.cpf,_that.birthday,_that.phone,_that.avatarImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Person implements Person {
   _Person({this.id, this.name, this.email, this.cpf, required this.birthday, required this.phone, this.avatarImage});
  factory _Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? email;
@override final  String? cpf;
@override final  String? birthday;
@override final  String? phone;
@override final  String? avatarImage;

/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonCopyWith<_Person> get copyWith => __$PersonCopyWithImpl<_Person>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Person&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.cpf, cpf) || other.cpf == cpf)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarImage, avatarImage) || other.avatarImage == avatarImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,cpf,birthday,phone,avatarImage);

@override
String toString() {
  return 'Person(id: $id, name: $name, email: $email, cpf: $cpf, birthday: $birthday, phone: $phone, avatarImage: $avatarImage)';
}


}

/// @nodoc
abstract mixin class _$PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$PersonCopyWith(_Person value, $Res Function(_Person) _then) = __$PersonCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? email, String? cpf, String? birthday, String? phone, String? avatarImage
});




}
/// @nodoc
class __$PersonCopyWithImpl<$Res>
    implements _$PersonCopyWith<$Res> {
  __$PersonCopyWithImpl(this._self, this._then);

  final _Person _self;
  final $Res Function(_Person) _then;

/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? cpf = freezed,Object? birthday = freezed,Object? phone = freezed,Object? avatarImage = freezed,}) {
  return _then(_Person(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,cpf: freezed == cpf ? _self.cpf : cpf // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,avatarImage: freezed == avatarImage ? _self.avatarImage : avatarImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
