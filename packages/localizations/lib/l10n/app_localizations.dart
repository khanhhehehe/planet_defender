import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginUsername.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get loginUsername;

  /// No description provided for @loginInputEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginInputEmail;

  /// No description provided for @loginPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// No description provided for @loginEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get loginEmail;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get loginForgotPassword;

  /// No description provided for @loginFaceId.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Face ID'**
  String get loginFaceId;

  /// No description provided for @loginWithAnother.
  ///
  /// In en, this message translates to:
  /// **'Sign in with another form'**
  String get loginWithAnother;

  /// No description provided for @loginNow.
  ///
  /// In en, this message translates to:
  /// **'Sign in now'**
  String get loginNow;

  /// No description provided for @loginNotMember.
  ///
  /// In en, this message translates to:
  /// **'Not a member? '**
  String get loginNotMember;

  /// No description provided for @loginGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get loginGoogle;

  /// No description provided for @loginFacebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get loginFacebook;

  /// No description provided for @loginApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get loginApple;

  /// No description provided for @loginFalseNamePass.
  ///
  /// In en, this message translates to:
  /// **'Error email or password'**
  String get loginFalseNamePass;

  /// No description provided for @loginOr.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get loginOr;

  /// No description provided for @requiredValidate.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredValidate;

  /// No description provided for @signupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Sign Up Success'**
  String get signupSuccess;

  /// No description provided for @signupNow.
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get signupNow;

  /// No description provided for @signupConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get signupConfirm;

  /// No description provided for @signupRetryOtpMessage.
  ///
  /// In en, this message translates to:
  /// **'Haven\'t received the code yet?'**
  String get signupRetryOtpMessage;

  /// No description provided for @signupRetryOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get signupRetryOtp;

  /// No description provided for @signupWithPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Sign up with phone number'**
  String get signupWithPhoneNumber;

  /// No description provided for @signupMember.
  ///
  /// In en, this message translates to:
  /// **'Already a member? '**
  String get signupMember;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @signupWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign up with email'**
  String get signupWithEmail;

  /// No description provided for @signupGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get signupGoogle;

  /// No description provided for @signupFacebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get signupFacebook;

  /// No description provided for @signupUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get signupUsername;

  /// No description provided for @signupEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signupEmail;

  /// No description provided for @signupApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get signupApple;

  /// No description provided for @signupConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get signupConfirmPassword;

  /// No description provided for @signupReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Referral code'**
  String get signupReferralCode;

  /// No description provided for @signupPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'+84 | Phone number'**
  String get signupPhoneNumber;

  /// No description provided for @signupFooterByfsel.
  ///
  /// In en, this message translates to:
  /// **'By registering on FSEL, you agree to our policies and Privacy Policy'**
  String get signupFooterByfsel;

  /// No description provided for @signupFooterRegisterForm.
  ///
  /// In en, this message translates to:
  /// **'Register in another form'**
  String get signupFooterRegisterForm;

  /// No description provided for @signupOr.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get signupOr;

  /// No description provided for @signupParent.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get signupParent;

  /// No description provided for @signupChild.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get signupChild;

  /// No description provided for @signupChildInformation.
  ///
  /// In en, this message translates to:
  /// **'Your child\'s information'**
  String get signupChildInformation;

  /// No description provided for @signupAccountChildName.
  ///
  /// In en, this message translates to:
  /// **'full Name'**
  String get signupAccountChildName;

  /// No description provided for @signupAccountChildSchool.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get signupAccountChildSchool;

  /// No description provided for @signupCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get signupCreate;

  /// No description provided for @signupAccountChildUserName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get signupAccountChildUserName;

  /// No description provided for @signupAccountChildPass.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signupAccountChildPass;

  /// No description provided for @signupAccountChildConfirmPass.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get signupAccountChildConfirmPass;

  /// No description provided for @signupEmailFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get signupEmailFullName;

  /// No description provided for @signupEmailPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signupEmailPassword;

  /// No description provided for @surveyYoutube.
  ///
  /// In en, this message translates to:
  /// **'Youtube'**
  String get surveyYoutube;

  /// No description provided for @surveyTiktok.
  ///
  /// In en, this message translates to:
  /// **'Tiktok'**
  String get surveyTiktok;

  /// No description provided for @surveyFriendsFamily.
  ///
  /// In en, this message translates to:
  /// **'Friends/Family'**
  String get surveyFriendsFamily;

  /// No description provided for @surveyNewspapers.
  ///
  /// In en, this message translates to:
  /// **'News/newspapers/blogs'**
  String get surveyNewspapers;

  /// No description provided for @surveyDifferent.
  ///
  /// In en, this message translates to:
  /// **'Different'**
  String get surveyDifferent;

  /// No description provided for @surveyTivi.
  ///
  /// In en, this message translates to:
  /// **'Tivi'**
  String get surveyTivi;

  /// No description provided for @surveyTitleSocial.
  ///
  /// In en, this message translates to:
  /// **'Where did you hear about FSEL?'**
  String get surveyTitleSocial;

  /// No description provided for @surveyTitleSurveypage.
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get surveyTitleSurveypage;

  /// No description provided for @surveyTitleBackage.
  ///
  /// In en, this message translates to:
  /// **'Choose your direction'**
  String get surveyTitleBackage;

  /// No description provided for @surveyTitleReason.
  ///
  /// In en, this message translates to:
  /// **'Why are you learning a foreign language?'**
  String get surveyTitleReason;

  /// No description provided for @surveyTitleLocation.
  ///
  /// In en, this message translates to:
  /// **'Your location?'**
  String get surveyTitleLocation;

  /// No description provided for @surveyTitleAge.
  ///
  /// In en, this message translates to:
  /// **'Determination of age and gender'**
  String get surveyTitleAge;

  /// No description provided for @surveyBackageKnowEnglish.
  ///
  /// In en, this message translates to:
  /// **'You already know a little English'**
  String get surveyBackageKnowEnglish;

  /// No description provided for @surveyBackageFirstLearningEnglish.
  ///
  /// In en, this message translates to:
  /// **'This is your first time learning English'**
  String get surveyBackageFirstLearningEnglish;

  /// No description provided for @surveyReasonCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture'**
  String get surveyReasonCulture;

  /// No description provided for @surveyReasonTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get surveyReasonTravel;

  /// No description provided for @surveyReasonMakeFriends.
  ///
  /// In en, this message translates to:
  /// **'Make friends and share'**
  String get surveyReasonMakeFriends;

  /// No description provided for @surveyReasonLearning.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get surveyReasonLearning;

  /// No description provided for @surveyReasonCareers.
  ///
  /// In en, this message translates to:
  /// **'Job Opportunities'**
  String get surveyReasonCareers;

  /// No description provided for @surveyLocationCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get surveyLocationCountry;

  /// No description provided for @surveyLocationCity.
  ///
  /// In en, this message translates to:
  /// **'Province/City'**
  String get surveyLocationCity;

  /// No description provided for @surveyTextSurveypage.
  ///
  /// In en, this message translates to:
  /// **'Before you begin, complete the survey to help FSEL learn more about you!'**
  String get surveyTextSurveypage;

  /// No description provided for @surveyGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get surveyGetStarted;

  /// No description provided for @surveyComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get surveyComplete;

  /// No description provided for @surveyAgeBoy.
  ///
  /// In en, this message translates to:
  /// **'Boy'**
  String get surveyAgeBoy;

  /// No description provided for @surveyAgeGirl.
  ///
  /// In en, this message translates to:
  /// **'Girl'**
  String get surveyAgeGirl;

  /// No description provided for @surveyAgeDay.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get surveyAgeDay;

  /// No description provided for @surveyAgeYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get surveyAgeYear;

  /// No description provided for @surveyAgeMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get surveyAgeMonth;

  /// No description provided for @surveyGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get surveyGoogle;

  /// No description provided for @surveyFacebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get surveyFacebook;

  /// No description provided for @survey.
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get survey;

  /// No description provided for @errorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Required data field'**
  String get errorEmpty;

  /// No description provided for @errorPassFormat.
  ///
  /// In en, this message translates to:
  /// **'Error password format'**
  String get errorPassFormat;

  /// No description provided for @errorConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Password and confirm password are not the same'**
  String get errorConfirmPassword;

  /// No description provided for @errorEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Error email format'**
  String get errorEmailFormat;

  /// No description provided for @errorPhoneFormat.
  ///
  /// In en, this message translates to:
  /// **'Error phone format'**
  String get errorPhoneFormat;

  /// No description provided for @errorData.
  ///
  /// In en, this message translates to:
  /// **'Error data'**
  String get errorData;

  /// No description provided for @forgotNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New passWord'**
  String get forgotNewPassword;

  /// No description provided for @forgotConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get forgotConfirmPassword;

  /// No description provided for @forgotEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Email or Phone number'**
  String get forgotEmailOrPhone;

  /// No description provided for @forgotButtonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get forgotButtonConfirm;

  /// No description provided for @forgotTitleChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get forgotTitleChangePassword;

  /// No description provided for @forgotTitleForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password ?'**
  String get forgotTitleForgotPassword;

  /// No description provided for @forgotButtonSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get forgotButtonSendOtp;

  /// No description provided for @resultTitle.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get resultTitle;

  /// No description provided for @resultCorrectAnswers.
  ///
  /// In en, this message translates to:
  /// **'Correct Answers'**
  String get resultCorrectAnswers;

  /// No description provided for @resultTokenReward.
  ///
  /// In en, this message translates to:
  /// **'Token reward:'**
  String get resultTokenReward;

  /// No description provided for @resultAgainOneMoreTime.
  ///
  /// In en, this message translates to:
  /// **'Let’s try again one more time, shall we?'**
  String get resultAgainOneMoreTime;

  /// No description provided for @resultDoneMessage.
  ///
  /// In en, this message translates to:
  /// **'You did it! Congrats!'**
  String get resultDoneMessage;

  /// No description provided for @resultViewDetail.
  ///
  /// In en, this message translates to:
  /// **'View detail'**
  String get resultViewDetail;

  /// No description provided for @resultTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get resultTryAgain;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @personalProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get personalProgress;

  /// No description provided for @personalQuestBoard.
  ///
  /// In en, this message translates to:
  /// **'Quest broad'**
  String get personalQuestBoard;

  /// No description provided for @personalCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get personalCalendar;

  /// No description provided for @personalSetting.
  ///
  /// In en, this message translates to:
  /// **'Settings & Privacy '**
  String get personalSetting;

  /// No description provided for @personalFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give Feedback'**
  String get personalFeedback;

  /// No description provided for @personalProfile.
  ///
  /// In en, this message translates to:
  /// **'Switch Profiles'**
  String get personalProfile;

  /// No description provided for @personalInfoStudentTitle.
  ///
  /// In en, this message translates to:
  /// **'Student Information'**
  String get personalInfoStudentTitle;

  /// No description provided for @personalInfoParentTitle.
  ///
  /// In en, this message translates to:
  /// **'Parent Information'**
  String get personalInfoParentTitle;

  /// No description provided for @personalInfoStudentFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get personalInfoStudentFullName;

  /// No description provided for @personalInfoStudentDOB.
  ///
  /// In en, this message translates to:
  /// **'DOB'**
  String get personalInfoStudentDOB;

  /// No description provided for @personalInfoStudentPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone No'**
  String get personalInfoStudentPhone;

  /// No description provided for @personalInfoStudentStudentId.
  ///
  /// In en, this message translates to:
  /// **'Student ID'**
  String get personalInfoStudentStudentId;

  /// No description provided for @personalInfoStudentEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get personalInfoStudentEmail;

  /// No description provided for @personalInfoStudentMembership.
  ///
  /// In en, this message translates to:
  /// **'Membership:'**
  String get personalInfoStudentMembership;

  /// No description provided for @personalInfoStudentCurrentLevel.
  ///
  /// In en, this message translates to:
  /// **'Current level:'**
  String get personalInfoStudentCurrentLevel;

  /// No description provided for @personalInfoStudentAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get personalInfoStudentAddress;

  /// No description provided for @personalInfoStudentOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get personalInfoStudentOccupation;

  /// No description provided for @personalInfoStudentClassId.
  ///
  /// In en, this message translates to:
  /// **'Class ID'**
  String get personalInfoStudentClassId;

  /// No description provided for @personalInfoStudentSchool.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get personalInfoStudentSchool;

  /// No description provided for @personalInfoParentFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get personalInfoParentFullName;

  /// No description provided for @personalInfoParentPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone No'**
  String get personalInfoParentPhone;

  /// No description provided for @personalInfoParentDOB.
  ///
  /// In en, this message translates to:
  /// **'DBO'**
  String get personalInfoParentDOB;

  /// No description provided for @personalInfoParentOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get personalInfoParentOccupation;

  /// No description provided for @personalInfoParentAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get personalInfoParentAddress;

  /// No description provided for @personalInfoParentEmail.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get personalInfoParentEmail;

  /// No description provided for @personalInfoStudent.
  ///
  /// In en, this message translates to:
  /// **'For Student'**
  String get personalInfoStudent;

  /// No description provided for @personalInfoParent.
  ///
  /// In en, this message translates to:
  /// **'For parent/guardian'**
  String get personalInfoParent;

  /// No description provided for @personalInfoReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Referral code'**
  String get personalInfoReferralCode;

  /// No description provided for @personalEditFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name:'**
  String get personalEditFullName;

  /// No description provided for @personalEditDOB.
  ///
  /// In en, this message translates to:
  /// **'DOB:'**
  String get personalEditDOB;

  /// No description provided for @personalEditPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone No:'**
  String get personalEditPhone;

  /// No description provided for @personalEditEmail.
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get personalEditEmail;

  /// No description provided for @personalEditAddress.
  ///
  /// In en, this message translates to:
  /// **'Address:'**
  String get personalEditAddress;

  /// No description provided for @personalEditSchool.
  ///
  /// In en, this message translates to:
  /// **'School:'**
  String get personalEditSchool;

  /// No description provided for @personalEditVerifying.
  ///
  /// In en, this message translates to:
  /// **' (Verifying)'**
  String get personalEditVerifying;

  /// No description provided for @personalEditOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation:'**
  String get personalEditOccupation;

  /// No description provided for @personalEditBtnChange.
  ///
  /// In en, this message translates to:
  /// **'Save change'**
  String get personalEditBtnChange;

  /// No description provided for @personaVerifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get personaVerifyEmailTitle;

  /// No description provided for @personaVerifyEmailChangeByEnter.
  ///
  /// In en, this message translates to:
  /// **'You can change by entering another email'**
  String get personaVerifyEmailChangeByEnter;

  /// No description provided for @personaVerifyEmailNote.
  ///
  /// In en, this message translates to:
  /// **'You must check your email to complete the confirmation. If you have not received the email, please check your spam folder or click the button below'**
  String get personaVerifyEmailNote;

  /// No description provided for @personaVerifyEmailBtn.
  ///
  /// In en, this message translates to:
  /// **'Send email verify'**
  String get personaVerifyEmailBtn;

  /// No description provided for @personaVerifyPhoneBtn.
  ///
  /// In en, this message translates to:
  /// **'Send me the code'**
  String get personaVerifyPhoneBtn;

  /// No description provided for @personaVerifyPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Add phone number'**
  String get personaVerifyPhoneTitle;

  /// No description provided for @personaVerifyPhoneSentOtpYou.
  ///
  /// In en, this message translates to:
  /// **'We will send an otp Verification to you '**
  String get personaVerifyPhoneSentOtpYou;

  /// No description provided for @lessonOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Lesson overview'**
  String get lessonOverviewTitle;

  /// No description provided for @lessonOverviewMessage.
  ///
  /// In en, this message translates to:
  /// **'This lessons typically involve the study and practice of reading, writing, speaking, and listening in the English language. The focus of the lessons may vary depending on the level of proficiency of the students and their learning goals.'**
  String get lessonOverviewMessage;

  /// No description provided for @lessonStart.
  ///
  /// In en, this message translates to:
  /// **'Start lesson'**
  String get lessonStart;

  /// No description provided for @overviewReading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get overviewReading;

  /// No description provided for @overviewSkill.
  ///
  /// In en, this message translates to:
  /// **'Skill overview'**
  String get overviewSkill;

  /// No description provided for @overviewReadingContent.
  ///
  /// In en, this message translates to:
  /// **'The reading section assesses the candidate\'s ability to understand and interpret written English'**
  String get overviewReadingContent;

  /// No description provided for @overviewListening.
  ///
  /// In en, this message translates to:
  /// **'Listening'**
  String get overviewListening;

  /// No description provided for @overviewListeningContent.
  ///
  /// In en, this message translates to:
  /// **'The listening section assesses the candidate\'s ability to understand spoken English in a variety of contexts'**
  String get overviewListeningContent;

  /// No description provided for @overviewWriting.
  ///
  /// In en, this message translates to:
  /// **'Writing'**
  String get overviewWriting;

  /// No description provided for @overviewWritingContent.
  ///
  /// In en, this message translates to:
  /// **'The writing section assesses the candidate\'s ability to communicate effectively in written English'**
  String get overviewWritingContent;

  /// No description provided for @overviewSpeaking.
  ///
  /// In en, this message translates to:
  /// **'Speaking'**
  String get overviewSpeaking;

  /// No description provided for @overviewSpeakingContent.
  ///
  /// In en, this message translates to:
  /// **'The speaking section assesses the candidate\'s ability to communicate effectively in spoken English'**
  String get overviewSpeakingContent;

  /// No description provided for @overviewGrammar.
  ///
  /// In en, this message translates to:
  /// **'Grammar'**
  String get overviewGrammar;

  /// No description provided for @overviewGrammarContent.
  ///
  /// In en, this message translates to:
  /// **'Grammar refers to the rules and principles that govern the structure and use of language in academic writing and communication'**
  String get overviewGrammarContent;

  /// No description provided for @overviewVocabulary.
  ///
  /// In en, this message translates to:
  /// **'Vocabulary'**
  String get overviewVocabulary;

  /// No description provided for @overviewVocabularyContent.
  ///
  /// In en, this message translates to:
  /// **'Vocabulary refers to the words and phrases that are used in academic writing and communication'**
  String get overviewVocabularyContent;

  /// No description provided for @scoreClassForum.
  ///
  /// In en, this message translates to:
  /// **'Class forum post'**
  String get scoreClassForum;

  /// No description provided for @scoreHomework.
  ///
  /// In en, this message translates to:
  /// **'Homework'**
  String get scoreHomework;

  /// No description provided for @scoreExtra.
  ///
  /// In en, this message translates to:
  /// **'Extra practice'**
  String get scoreExtra;

  /// No description provided for @scoreNotes.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get scoreNotes;

  /// No description provided for @unitIndicator.
  ///
  /// In en, this message translates to:
  /// **'Unit Indicator'**
  String get unitIndicator;

  /// No description provided for @unitSkillDiagram.
  ///
  /// In en, this message translates to:
  /// **'Skill diagram'**
  String get unitSkillDiagram;

  /// No description provided for @signinFaceId.
  ///
  /// In en, this message translates to:
  /// **'Đăng nhập bằng Face ID'**
  String get signinFaceId;

  /// No description provided for @signInWithAnother.
  ///
  /// In en, this message translates to:
  /// **'Đăng nhập bằng hình thức khác'**
  String get signInWithAnother;

  /// No description provided for @parent.
  ///
  /// In en, this message translates to:
  /// **'Phụ Huynh'**
  String get parent;

  /// No description provided for @children.
  ///
  /// In en, this message translates to:
  /// **'Học Sinh'**
  String get children;

  /// No description provided for @unitContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get unitContinue;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionBackToLesson.
  ///
  /// In en, this message translates to:
  /// **'Back to lesson'**
  String get actionBackToLesson;

  /// No description provided for @notData.
  ///
  /// In en, this message translates to:
  /// **'Không tìm thấy dữ liệu phù hợp'**
  String get notData;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Tên'**
  String get name;

  /// No description provided for @school.
  ///
  /// In en, this message translates to:
  /// **'Trường'**
  String get school;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Tạo'**
  String get create;

  /// No description provided for @childInformation.
  ///
  /// In en, this message translates to:
  /// **'Thông tin con của bạn'**
  String get childInformation;

  /// No description provided for @errorForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Sai Email hoặc SĐT'**
  String get errorForgotPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @emailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Email hoặc PassWord'**
  String get emailOrPassword;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Đồng ý'**
  String get accept;

  /// No description provided for @dialogLogoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại để tiếp tục'**
  String get dialogLogoutTitle;

  /// No description provided for @dialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get dialogTitle;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Đóng'**
  String get close;

  /// No description provided for @tesTotalQuestion.
  ///
  /// In en, this message translates to:
  /// **'Total question'**
  String get tesTotalQuestion;

  /// No description provided for @tesTotalTime.
  ///
  /// In en, this message translates to:
  /// **'Total time'**
  String get tesTotalTime;

  /// No description provided for @tesMessageConfirm.
  ///
  /// In en, this message translates to:
  /// **'The Final Test will help you synthesize knowledge. Are you ready?'**
  String get tesMessageConfirm;

  /// No description provided for @tesStartNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get tesStartNow;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'dd'**
  String get day;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'MM'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'yyyy'**
  String get year;

  /// No description provided for @dialogConfirmOk.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get dialogConfirmOk;

  /// No description provided for @dialogConfirmNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get dialogConfirmNo;

  /// No description provided for @settingNotify.
  ///
  /// In en, this message translates to:
  /// **'Notify setting'**
  String get settingNotify;

  /// No description provided for @settingNotifyGame.
  ///
  /// In en, this message translates to:
  /// **'Game/High teach notification'**
  String get settingNotifyGame;

  /// No description provided for @settingNotifyFeedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback notification'**
  String get settingNotifyFeedback;

  /// No description provided for @settingNotifyLiveClass.
  ///
  /// In en, this message translates to:
  /// **'Live class notification'**
  String get settingNotifyLiveClass;

  /// No description provided for @settingNotifyForumPost.
  ///
  /// In en, this message translates to:
  /// **'Forum post notification'**
  String get settingNotifyForumPost;

  /// No description provided for @settingChangePass.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get settingChangePass;

  /// No description provided for @settingLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingLanguage;

  /// No description provided for @settingHelp.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingHelp;

  /// No description provided for @settingFAQ.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get settingFAQ;

  /// No description provided for @settingSupportTicket.
  ///
  /// In en, this message translates to:
  /// **'Support ticket'**
  String get settingSupportTicket;

  /// No description provided for @settingCache.
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get settingCache;

  /// No description provided for @settingVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingVersion;

  /// No description provided for @settingPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get settingPrivacy;

  /// No description provided for @settingTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get settingTerms;

  /// No description provided for @settingLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get settingLogout;

  /// No description provided for @settingDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get settingDelete;

  /// No description provided for @settingTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings & Privacy'**
  String get settingTitle;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @changeCurrentPass.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get changeCurrentPass;

  /// No description provided for @changeNewPass.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get changeNewPass;

  /// No description provided for @changeConfirmPass.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get changeConfirmPass;

  /// No description provided for @changeButton.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changeButton;

  /// No description provided for @changeForgotPass.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get changeForgotPass;

  /// No description provided for @changeForgotPlease.
  ///
  /// In en, this message translates to:
  /// **'Please enter the email you used to register your account, we can help you recover your password'**
  String get changeForgotPlease;

  /// No description provided for @changeForgotSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get changeForgotSendOtp;

  /// No description provided for @changeConfirmEmail.
  ///
  /// In en, this message translates to:
  /// **'Confirm email'**
  String get changeConfirmEmail;

  /// No description provided for @changeConfirmEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter the code we sent to the email'**
  String get changeConfirmEnter;

  /// No description provided for @changeConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get changeConfirmButton;

  /// No description provided for @changeConfirmSendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code again'**
  String get changeConfirmSendCode;

  /// No description provided for @welcomePtTest.
  ///
  /// In en, this message translates to:
  /// **'Welcome To FSEL\'s Placement Test'**
  String get welcomePtTest;

  /// No description provided for @introductionPtTest.
  ///
  /// In en, this message translates to:
  /// **'Are you ready to take the Test to check your current level before taking the official course?'**
  String get introductionPtTest;

  /// No description provided for @chooseTest.
  ///
  /// In en, this message translates to:
  /// **'Which course would you like to join? Please choose correctly so that the system gives the appropriate entrance test!'**
  String get chooseTest;

  /// No description provided for @errorCurrentPass.
  ///
  /// In en, this message translates to:
  /// **'old password is incorrect'**
  String get errorCurrentPass;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'I\'m ready'**
  String get ready;

  /// No description provided for @backToChooseCourse.
  ///
  /// In en, this message translates to:
  /// **'Back to choose course'**
  String get backToChooseCourse;

  /// No description provided for @viewReport.
  ///
  /// In en, this message translates to:
  /// **'View report'**
  String get viewReport;

  /// No description provided for @completeLesson.
  ///
  /// In en, this message translates to:
  /// **'Complete Lesson'**
  String get completeLesson;

  /// No description provided for @reviewLesson.
  ///
  /// In en, this message translates to:
  /// **'Review Lesson'**
  String get reviewLesson;

  /// No description provided for @resumeLesson.
  ///
  /// In en, this message translates to:
  /// **'Resume Lesson'**
  String get resumeLesson;

  /// No description provided for @allQuestionNotFill.
  ///
  /// In en, this message translates to:
  /// **'You must answer all questions before submit !'**
  String get allQuestionNotFill;

  /// No description provided for @progressAboutFsel.
  ///
  /// In en, this message translates to:
  /// **'How do you feel about FSEL?'**
  String get progressAboutFsel;

  /// No description provided for @progressReceivedYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'It would be great if FSEL received your feedback on improving service quality'**
  String get progressReceivedYourFeedback;

  /// No description provided for @homeLessonOverview.
  ///
  /// In en, this message translates to:
  /// **'Lesson overview'**
  String get homeLessonOverview;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @diary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get diary;

  /// No description provided for @currentRating.
  ///
  /// In en, this message translates to:
  /// **'Current rating'**
  String get currentRating;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @top.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get top;

  /// No description provided for @fsel.
  ///
  /// In en, this message translates to:
  /// **'FSEL'**
  String get fsel;

  /// No description provided for @soundtrack.
  ///
  /// In en, this message translates to:
  /// **'Soundtrack'**
  String get soundtrack;

  /// No description provided for @soundEffects.
  ///
  /// In en, this message translates to:
  /// **'Sound effects'**
  String get soundEffects;

  /// No description provided for @graphicsQuality.
  ///
  /// In en, this message translates to:
  /// **'Graphics quality'**
  String get graphicsQuality;

  /// No description provided for @vibrate.
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get vibrate;

  /// No description provided for @linkAccounts.
  ///
  /// In en, this message translates to:
  /// **'Link accounts'**
  String get linkAccounts;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @deleteData.
  ///
  /// In en, this message translates to:
  /// **'Delete data'**
  String get deleteData;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @academicLevel.
  ///
  /// In en, this message translates to:
  /// **'Academic level'**
  String get academicLevel;

  /// No description provided for @academic.
  ///
  /// In en, this message translates to:
  /// **'Academic'**
  String get academic;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @guestAccount.
  ///
  /// In en, this message translates to:
  /// **'Guest account'**
  String get guestAccount;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @doYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out of this account?'**
  String get doYouWantToLogout;

  /// No description provided for @doYouWantDeleteData.
  ///
  /// In en, this message translates to:
  /// **'Your data will be permanently deleted. Do you want to continue?'**
  String get doYouWantDeleteData;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @doYouWantToChangeLevelAcademic.
  ///
  /// In en, this message translates to:
  /// **'Changing your academic level will immediately reset your rating to 0. Are you sure you want to change?'**
  String get doYouWantToChangeLevelAcademic;

  /// No description provided for @startGame.
  ///
  /// In en, this message translates to:
  /// **'Start game'**
  String get startGame;

  /// No description provided for @ielts.
  ///
  /// In en, this message translates to:
  /// **'IELTS'**
  String get ielts;

  /// No description provided for @tooltipAcademic.
  ///
  /// In en, this message translates to:
  /// **'This content is for students studying general English for educational purposes. It is divided into 6 levels, from beginner to advanced.'**
  String get tooltipAcademic;

  /// No description provided for @tooltipIelts.
  ///
  /// In en, this message translates to:
  /// **'This content is for students preparing for the official IELTS exam. It is divided into 3 levels based on the target band score the learner wishes to achieve on the exam.'**
  String get tooltipIelts;

  /// No description provided for @doYouWantToChangeAcademicLevel.
  ///
  /// In en, this message translates to:
  /// **'Changing your academic level will immediately reset your ranking score to 0. Are you sure you want to change?'**
  String get doYouWantToChangeAcademicLevel;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @passwordCodition.
  ///
  /// In en, this message translates to:
  /// **'*Password must have at least 8 characters (Including 1 capital letter, 1 number and 1 special character)'**
  String get passwordCodition;

  /// No description provided for @changePassSuccessful.
  ///
  /// In en, this message translates to:
  /// **'You have successfully changed your password. Press back to return to settings or, the screen will close automatically later'**
  String get changePassSuccessful;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @linkAccount.
  ///
  /// In en, this message translates to:
  /// **'Link account'**
  String get linkAccount;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @accountDoesntExist.
  ///
  /// In en, this message translates to:
  /// **'Account doesn’t exist'**
  String get accountDoesntExist;

  /// No description provided for @selectAccount1.
  ///
  /// In en, this message translates to:
  /// **'We noticed your account exists'**
  String get selectAccount1;

  /// No description provided for @selectAccount2.
  ///
  /// In en, this message translates to:
  /// **'data sources. Please select a data source to continue.'**
  String get selectAccount2;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @linkAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'You have successfully linked your account. Click restart to refresh data. The system will automatically reboot later'**
  String get linkAccountSuccess;

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
