import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  static const String appName = 'CT Scan Diagnosis';
  static const String welcomeBack = 'welcome_back';
  static const String signInToContinue = 'sign_in_to_continue';
  static const String emailAddress = 'email_address';
  static const String password = 'password';
  static const String forgotPassword = 'forgot_password';
  static const String signIn = 'sign_in';
  static const String doNotHaveAnAccount = 'do_not_have_an_account';
  static const String signUp = 'sign_up';
  static const String fullName = 'full_name';
  static const String phoneNumber = 'phone_number';
  static const String alreadyHaveAnAccount = 'already_have_an_account';
  static const String verifyYourEmail = 'verify_your_email';
  static const String weHaveSentYouAnOTPToYourEmail =
      'we_have_sent_you_an_otp_to_your_email';
  static const String enterOTPCode = 'enter_otp_code';
  static const String submit = 'submit';
  static const String resendOTP = 'resend_otp';

  //firebase collection names
  static const String usersCollection = 'users';
  static const String doctorsCollection = 'doctors';
  static const String reportCollection = 'reports';
  static const String messageCollection = 'Messages';

  //ct scan result labels
  static const String normal = 'Normal';
  static const String reportTitle = 'Swollen kidney with 3 stones';
  static const String reportDescription =
      'A swollen kidney with three visible stones located in the lower pole region. The stones appear to be causing some obstruction, leading to mild hydronephrosis. No signs of infection or other abnormalities detected.';

  static const String cystTitle = "Cyst";
  static const String cystDescription =
      "A cyst is a fluid-filled sac that can develop in various parts of the body, including the kidneys. "
      "Kidney cysts are often benign (non-cancerous) and don't cause symptoms unless they grow large.";

  static const String normalTitle = "Normal";
  static const String normalDescription =
      "The kidney is functioning normally. There are no abnormal findings in the CT scan, indicating a healthy kidney.";

  static const String stoneTitle = "Kidney Stone";
  static const String stoneDescription =
      "Kidney stones are hard deposits of minerals and salts that form inside the kidneys. "
      "They can cause intense pain when they move through the urinary tract and may require medical intervention.";

  static const String tumorTitle = "Kidney Tumor";
  static const String tumorDescription =
      "A tumor is an abnormal growth of tissue in the kidney that can be either benign or malignant (cancerous). "
      "Further tests and medical consultation are required for diagnosis and treatment.";
}

String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 30) {
    final months = (difference.inDays / 30).floor();
    return '$months ${months == 1 ? 'month' : 'months'} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'min' : 'min'} ago';
  } else {
    return 'just now';
  }
}

class GoogleCredentials {
  static String get apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
}

extension ExtString on String {
  bool get isInvalidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.+_]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return !emailRegExp.hasMatch(this);
  }

  bool get isInvalidOTPCode {
    return length != 6;
  }

  bool get isInValidName {
    final nameRegExp = RegExp(
      r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$",
    );
    return !nameRegExp.hasMatch(this);
  }

  bool get isInvalidUrl {
    final urlRegExp = RegExp(
      r'^(?:http|https):\/\/' // scheme
      r'(?:(?:[A-Z0-9][A-Z0-9_-]*)(?:\.[A-Z0-9][A-Z0-9_-]*)+)' // domain
      r'(?::\d+)?' // port
      r'(?:\/[^\s]*)?' // path
      r'(?:\?[^\s]*)?' // query parameters
      r'(?:#[^\s]*)?$', // fragment
      caseSensitive: false,
    );
    return urlRegExp.hasMatch(this);
  }

  bool get isInValidAlphabeticalText {
    final regExp = RegExp(r'^[a-zA-Z]+$');
    return !regExp.hasMatch(this);
  }

  bool get isInvalidUUId {
    // Define a regular expression to match a UUID pattern.
    final uuidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$',
      caseSensitive: false,
    );

    // Check if the provided string matches the UUID pattern.
    return !uuidRegex.hasMatch(this);
  }

  String get stripHtmlTags {
    final exp = RegExp('<[^>]*>', multiLine: true, dotAll: true);
    return replaceAll(exp, '');
  }

  bool get isInValidPassword {
    final rexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    return !rexExp.hasMatch(this);
  }

  bool get isInValidPhone {
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,}$');
    return !phoneRegExp.hasMatch(this);
  }

  bool equalsTo(String secondString) {
    return this == secondString;
  }

  bool isNotEqualTo(String secondString) {
    return this != secondString;
  }

  String get localized => this.tr();
  String? get firstCharacter => isEmpty ? null : this[0];

  String capitalizeWords() {
    if (isEmpty) {
      return this;
    }

    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');
  }

  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  String get initials {
    final items = split(' ')
        .map((e) => e.firstCharacter)
        .where((element) => element != null)
        .where((element) => element!.isNotEmpty)
        .toList();
    final length = items.length;
    if (items.isEmpty) {
      return '';
    } else if (length == 1) {
      return items.join();
    } else {
      return [items[0], items[length - 1]].join();
    }
  }
}
