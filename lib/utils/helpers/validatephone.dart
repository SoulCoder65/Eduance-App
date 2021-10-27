
bool phoneValidate(String phone) {
  if (RegExp(
      r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
      .hasMatch(phone)) {
    return true;
  } else {
    return false;
  }
}