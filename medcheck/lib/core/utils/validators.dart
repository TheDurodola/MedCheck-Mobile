class Validators {
  // 1. Standard Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Regex for Email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Null means "No Error" (Valid)
  }

  // 2. Password Strength (Min 8 chars)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  // 3. MedCheck Specific: NAFDAC Number Validation
  // Format assumption: "A1-1234" or "01-1234"
  static String? validateNafdacNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'NAFDAC Number is required';
    }
    final nafdacRegex = RegExp(r'^[A-Z0-9]{2}-\d{4}$');
    if (!nafdacRegex.hasMatch(value)) {
      return 'Invalid format (e.g., A1-1234)';
    }
    return null;
  }

  static String? validateAge(String? value) {
    // 1. Basic Check: Did they enter anything?
    if (value == null || value.isEmpty) {
      return "Date of Birth is required";
    }

    // 2. Parse the string (YYYY-MM-DD) into a DateTime object
    try {
      final DateTime birthDate = DateTime.parse(value);
      final DateTime today = DateTime.now();

      // 3. Calculate the "Cutoff Date" (Today minus 18 years)
      // Example: If today is Feb 3, 2026, the cutoff is Feb 3, 2008.
      final DateTime eighteenYearsAgo = DateTime(
        today.year - 18,
        today.month,
        today.day,
      );

      // 4. Comparison
      // If birthDate is AFTER the cutoff, they are younger than 18.
      if (birthDate.isAfter(eighteenYearsAgo)) {
        return "You must be at least 18 years old";
      }

      return null; // Valid!
    } catch (e) {
      return "Invalid Date Format";
    }
  }
}