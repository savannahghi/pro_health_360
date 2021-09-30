bool alignLabelWithHint(int? maxLines) => maxLines != null && maxLines > 1;

String getDisplayName(String firstName, String lastName) {
  final String initialFirstName = firstName.trim();
  final String initialLastName = lastName.trim();
  return '$initialFirstName $initialLastName';
}
