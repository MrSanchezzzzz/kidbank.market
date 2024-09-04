class ToyListingValidator{
  static String? validateTitle(String? value) {
    if (value == null) {
      return null;
    } else if (value.length > 400) {
      return 'Max lenght limit overflowed';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null) {
      return null;
    }
    if (value.length > 1000) {
      return 'Max lenght limit overflowed';
    }
    return null;
  }
}