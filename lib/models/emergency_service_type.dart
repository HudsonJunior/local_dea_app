enum EmergencyServiceType { dea, hospital, samu }

extension EmergencyServiceExt on EmergencyServiceType {
  int get value {
    switch (this) {
      case EmergencyServiceType.dea:
        return 0;
      case EmergencyServiceType.hospital:
        return 1;
      case EmergencyServiceType.samu:
        return 2;
    }
  }

  String get stringValue {
    switch (this) {
      case EmergencyServiceType.dea:
        return 'Dea';
      case EmergencyServiceType.hospital:
        return 'Hospital';
      case EmergencyServiceType.samu:
        return 'Samu';
    }
  }

  String get icon {
    switch (this) {
      case EmergencyServiceType.dea:
        return 'assets/dea_icon.png';
      case EmergencyServiceType.hospital:
        return 'assets/edificio-hospitalar.png';
      case EmergencyServiceType.samu:
        return 'assets/samu_icon.png';
    }
  }

  static EmergencyServiceType fromInt(int value) {
    switch (value) {
      case 0:
        return EmergencyServiceType.dea;
      case 1:
        return EmergencyServiceType.hospital;
      case 2:
        return EmergencyServiceType.samu;
      default:
        return EmergencyServiceType.dea;
    }
  }
}
