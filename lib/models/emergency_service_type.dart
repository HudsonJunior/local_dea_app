enum EmergencyServiceType { dea, hospital, upa, samu }

extension EmergencyServiceExt on EmergencyServiceType {
  int get value {
    switch (this) {
      case EmergencyServiceType.dea:
        return 0;
      case EmergencyServiceType.hospital:
        return 1;
      case EmergencyServiceType.samu:
        return 2;
      case EmergencyServiceType.upa:
        return 3;
    }
  }

  String get stringValue {
    switch (this) {
      case EmergencyServiceType.dea:
        return 'Dea';
      case EmergencyServiceType.hospital:
        return 'Hospital';
      case EmergencyServiceType.samu:
        return 'SAMU';
      case EmergencyServiceType.upa:
        return 'UPA';
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
      case EmergencyServiceType.upa:
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
      case 3:
        return EmergencyServiceType.upa;
      default:
        return EmergencyServiceType.dea;
    }
  }
}
