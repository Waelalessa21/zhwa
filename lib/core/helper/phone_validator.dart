class PhoneValidator {
  static const String _saudiPhonePattern = r'^5[0-9]{8}$';

  static bool isValidSaudiPhone(String phoneNumber) {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanPhone.length == 9) {
      return RegExp(_saudiPhonePattern).hasMatch(cleanPhone);
    }

    if (cleanPhone.length == 10 && cleanPhone.startsWith('05')) {
      return RegExp(_saudiPhonePattern).hasMatch(cleanPhone.substring(1));
    }

    if (cleanPhone.length == 13 && cleanPhone.startsWith('9665')) {
      return RegExp(_saudiPhonePattern).hasMatch(cleanPhone.substring(3));
    }

    return false;
  }

  static String formatSaudiPhone(String phoneNumber) {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanPhone.length == 9 && cleanPhone.startsWith('5')) {
      return '+966$cleanPhone';
    }

    if (cleanPhone.length == 10 && cleanPhone.startsWith('05')) {
      return '+966${cleanPhone.substring(1)}';
    }

    if (cleanPhone.length == 13 && cleanPhone.startsWith('9665')) {
      return '+$cleanPhone';
    }

    return phoneNumber;
  }
}
