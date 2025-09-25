// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class UserModelAdapter extends TypeAdapter<UserModel> {
//   @override
//   final int typeId = 0;

//   @override
//   UserModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return UserModel(
//       isAuthenticated: fields[0] as bool?,
//       id: fields[1] as int?,
//       username: fields[3] as String?,
//       email: fields[4] as String?,
//       deviceToken: fields[5] as String?,
//       imageUrl: fields[6] as dynamic,
//       roles: (fields[7] as List?)?.cast<String>(),
//       branchId: fields[2] as int?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, UserModel obj) {
//     writer
//       ..writeByte(8)
//       ..writeByte(0)
//       ..write(obj.isAuthenticated)
//       ..writeByte(1)
//       ..write(obj.id)
//       ..writeByte(2)
//       ..write(obj.branchId)
//       ..writeByte(3)
//       ..write(obj.username)
//       ..writeByte(4)
//       ..write(obj.email)
//       ..writeByte(5)
//       ..write(obj.deviceToken)
//       ..writeByte(6)
//       ..write(obj.imageUrl)
//       ..writeByte(7)
//       ..write(obj.roles);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is UserModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
