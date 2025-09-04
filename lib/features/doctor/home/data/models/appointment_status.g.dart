// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentStatusAdapter extends TypeAdapter<AppointmentStatus> {
  @override
  final int typeId = 1;

  @override
  AppointmentStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppointmentStatus.pending;
      case 1:
        return AppointmentStatus.completed;
      case 2:
        return AppointmentStatus.missed;
      default:
        return AppointmentStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, AppointmentStatus obj) {
    switch (obj) {
      case AppointmentStatus.pending:
        writer.writeByte(0);
        break;
      case AppointmentStatus.completed:
        writer.writeByte(1);
        break;
      case AppointmentStatus.missed:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
