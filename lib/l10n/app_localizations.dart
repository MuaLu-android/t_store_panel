import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// Default admin email
  ///
  /// In en, this message translates to:
  /// **'support@codingwitht.com'**
  String get adminEmail;

  /// Default admin password
  ///
  /// In en, this message translates to:
  /// **'Admin@123'**
  String get adminPassword;

  /// Storage path for banners
  ///
  /// In en, this message translates to:
  /// **'/Banners'**
  String get bannersStoragePath;

  /// Storage path for brands
  ///
  /// In en, this message translates to:
  /// **'/Communitys'**
  String get brandsStoragePath;

  /// Storage path for categories
  ///
  /// In en, this message translates to:
  /// **'/Categories'**
  String get categoriesStoragePath;

  /// Storage path for products
  ///
  /// In en, this message translates to:
  /// **'/Products'**
  String get productsStoragePath;

  /// Storage path for users
  ///
  /// In en, this message translates to:
  /// **'/Users'**
  String get usersStoragePath;

  /// Storage path for users
  ///
  /// In en, this message translates to:
  /// **'/Settings'**
  String get settingStoragePath;

  /// Storage path for users
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// The word 'and'
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// Skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Done button
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Submit button
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'T Store'**
  String get appName;

  /// Continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get tContinue;

  /// Onboarding step 1 title
  ///
  /// In en, this message translates to:
  /// **'Choose your product'**
  String get onBoardingTitle1;

  /// Onboarding step 2 title
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get onBoardingTitle2;

  /// Onboarding step 3 title
  ///
  /// In en, this message translates to:
  /// **'Deliver at your door step'**
  String get onBoardingTitle3;

  /// Onboarding step 1 subtitle
  ///
  /// In en, this message translates to:
  /// **'Welcome to a World of Limitless Choices - Your Perfect Product Awaits!'**
  String get onBoardingSubTitle1;

  /// Onboarding step 2 subtitle
  ///
  /// In en, this message translates to:
  /// **'For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!'**
  String get onBoardingSubTitle2;

  /// Onboarding step 3 subtitle
  ///
  /// In en, this message translates to:
  /// **'From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!'**
  String get onBoardingSubTitle3;

  /// First name field
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Last name field
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Email field
  ///
  /// In en, this message translates to:
  /// **'E-Mail'**
  String get email;

  /// Password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// New password field
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Username field
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Phone number field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNo;

  /// Remember me checkbox
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// Forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// Sign in button
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Create account button
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Or sign in with text
  ///
  /// In en, this message translates to:
  /// **'or sign in with'**
  String get orSignInWith;

  /// Or sign up with text
  ///
  /// In en, this message translates to:
  /// **'or sign up with'**
  String get orSignUpWith;

  /// I agree to text
  ///
  /// In en, this message translates to:
  /// **'I agree to'**
  String get iAgreeTo;

  /// Privacy policy link
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Terms of use link
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// Verification code label
  ///
  /// In en, this message translates to:
  /// **'verificationCode'**
  String get verificationCode;

  /// Resend email button
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get resendEmail;

  /// Resend email in text
  ///
  /// In en, this message translates to:
  /// **'Resend email in'**
  String get resendEmailIn;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get loginTitle;

  /// Login screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Discover Limitless Choices and Unmatched Convenience.'**
  String get loginSubTitle;

  /// Signup screen title
  ///
  /// In en, this message translates to:
  /// **'Let’s create your account'**
  String get signupTitle;

  /// Forgot password screen title
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forgetPasswordTitle;

  /// Forgot password screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.'**
  String get forgetPasswordSubTitle;

  /// Password reset email sent title
  ///
  /// In en, this message translates to:
  /// **'Password Reset Email Sent'**
  String get changeYourPasswordTitle;

  /// Password reset email sent subtitle
  ///
  /// In en, this message translates to:
  /// **'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.'**
  String get changeYourPasswordSubTitle;

  /// Confirm email title
  ///
  /// In en, this message translates to:
  /// **'Verify your email address!'**
  String get confirmEmail;

  /// Confirm email subtitle
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.'**
  String get confirmEmailSubTitle;

  /// Email not received message
  ///
  /// In en, this message translates to:
  /// **'Didn’t get the email? Check your junk/spam or resend it.'**
  String get emailNotReceivedMessage;

  /// Account created title
  ///
  /// In en, this message translates to:
  /// **'Your account successfully created!'**
  String get yourAccountCreatedTitle;

  /// Account created subtitle
  ///
  /// In en, this message translates to:
  /// **'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!'**
  String get yourAccountCreatedSubTitle;

  /// Popular products section title
  ///
  /// In en, this message translates to:
  /// **'Popular Products'**
  String get popularProducts;

  /// Home app bar title
  ///
  /// In en, this message translates to:
  /// **'Good day for shopping'**
  String get homeAppbarTitle;

  /// Home app bar subtitle
  ///
  /// In en, this message translates to:
  /// **'Taimoor Sikander'**
  String get homeAppbarSubTitle;

  /// Sidebar menu title
  ///
  /// In en, this message translates to:
  /// **'MENU'**
  String get menu;

  /// Sidebar other section title
  ///
  /// In en, this message translates to:
  /// **'OTHER'**
  String get other;

  /// Dashboard menu item
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// Media menu item
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// Categories menu item
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Products menu item
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// Customers menu item
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// Banners menu item
  ///
  /// In en, this message translates to:
  /// **'Banners'**
  String get banners;

  /// Orders menu item
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// Brands menu item
  ///
  /// In en, this message translates to:
  /// **'Communitys'**
  String get brands;

  /// Profile menu item
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Settings menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Logout menu item
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Title for the dashboard screen
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// Title for total sales card
  ///
  /// In en, this message translates to:
  /// **'Sales Total'**
  String get salesTotal;

  /// Title for average order card
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get averageOrder;

  /// Title for total orders card
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get totalOrders;

  /// Title for visitors card
  ///
  /// In en, this message translates to:
  /// **'Visitors'**
  String get visitors;

  /// Text for comparison period
  ///
  /// In en, this message translates to:
  /// **'Compared to Dec 2025'**
  String get comparedTo;

  /// Title for the weekly sales graph
  ///
  /// In en, this message translates to:
  /// **'Weekly Sales'**
  String get weeklySales;

  /// Short for Monday
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// Short for Tuesday
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// Short for Wednesday
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// Short for Thursday
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// Short for Friday
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// Short for Saturday
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// Short for Sunday
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

  /// Title for recent orders section
  ///
  /// In en, this message translates to:
  /// **'Recent Orders'**
  String get recentOrders;

  /// Order ID column
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderId;

  /// Order date column
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get orderDate;

  /// Order items column
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get orderItems;

  /// Order status column
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get orderStatus;

  /// Order total column
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get orderTotal;

  /// Order status: Pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// Order status: Processing
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get statusProcessing;

  /// Order status: Shipped
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get statusShipped;

  /// Order status: Delivered
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get statusDelivered;

  /// Order status: Cancelled
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// Title for order status pie chart
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatusChart;

  /// Breadcrumb details for media
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Button to upload images
  ///
  /// In en, this message translates to:
  /// **'Upload Images'**
  String get uploadImages;

  /// Instruction for drag and drop area
  ///
  /// In en, this message translates to:
  /// **'Drag and Drop Images here'**
  String get dragDropImagesHere;

  /// Button to select images
  ///
  /// In en, this message translates to:
  /// **'Select Images'**
  String get selectImages;

  /// Label for gallery folder dropdown
  ///
  /// In en, this message translates to:
  /// **'Gallery Folder'**
  String get galleryFolder;

  /// Button to remove all selected images
  ///
  /// In en, this message translates to:
  /// **'Remove All'**
  String get removeAll;

  /// Button to upload selected images
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// Option for all media folders
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get mediaFolderAll;

  /// Message when no media is found
  ///
  /// In en, this message translates to:
  /// **'No media found.'**
  String get mediaNoMediaFound;

  /// Hint text for searching images
  ///
  /// In en, this message translates to:
  /// **'Search images...'**
  String get mediaSearchHint;

  /// Message when no image is selected
  ///
  /// In en, this message translates to:
  /// **'No image selected.'**
  String get mediaEmptySelection;

  /// Button to select
  ///
  /// In en, this message translates to:
  /// **'Mores'**
  String get mediaSelect;

  /// Button to cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get mediaCancel;

  /// Button to delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get mediaDelete;

  /// Confirmation message for deleting image
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this image?'**
  String get mediaConfirmDelete;

  /// Button for yes/confirm
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get mediaYes;

  /// Button for no/cancel
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get mediaNo;

  /// Heading for create product page
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get productCreateHeading;

  /// Heading for edit product page
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get productEditHeading;

  /// Heading for create banner page
  ///
  /// In en, this message translates to:
  /// **'Create Banner'**
  String get bannerCreateHeading;

  /// Heading for update/edit banner page
  ///
  /// In en, this message translates to:
  /// **'Update Banner'**
  String get bannerEditHeading;

  /// Heading for create brand page
  ///
  /// In en, this message translates to:
  /// **'Create Brand'**
  String get brandCreateHeading;

  /// Heading for update/edit brand page
  ///
  /// In en, this message translates to:
  /// **'Update Brand'**
  String get brandEditHeading;

  /// Breadcrumb for customer details page
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customerDetailsBreadcrumb;

  /// Breadcrumb for order details page
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetailsBreadcrumb;

  /// Breadcrumb for create category page
  ///
  /// In en, this message translates to:
  /// **'Create Category'**
  String get categoryBreadcrumbCreate;

  /// Breadcrumb for update/edit category page
  ///
  /// In en, this message translates to:
  /// **'Update Category'**
  String get categoryBreadcrumbEdit;

  /// Heading for create category page
  ///
  /// In en, this message translates to:
  /// **'Create Category'**
  String get categoryCreateHeading;

  /// Heading for update/edit category page
  ///
  /// In en, this message translates to:
  /// **'Update Category'**
  String get categoryEditHeading;

  /// Hint text for the search field in the header
  ///
  /// In en, this message translates to:
  /// **'Search anything...'**
  String get header_search_hint;

  /// Title for error snackbar in media
  ///
  /// In en, this message translates to:
  /// **'Oh snap'**
  String get media_error_title;

  /// Message for error fetching images
  ///
  /// In en, this message translates to:
  /// **'Unable to fetch Images, Something went wrong. Try again'**
  String get media_error_fetch;

  /// Title for select folder warning
  ///
  /// In en, this message translates to:
  /// **'Select Folder'**
  String get media_select_folder_title;

  /// Message for select folder warning
  ///
  /// In en, this message translates to:
  /// **'Please select the Folder in Order to upload the Images.'**
  String get media_select_folder_message;

  /// Title for upload images confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Upload Images'**
  String get media_upload_confirm_title;

  /// Content for upload images confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to upload all the Image in '**
  String get media_upload_confirm_message;

  /// Confirm button for upload images
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get media_upload_confirm_button;

  /// Title for uploading images dialog
  ///
  /// In en, this message translates to:
  /// **'Uploading Images'**
  String get media_uploading_title;

  /// Content for uploading images dialog
  ///
  /// In en, this message translates to:
  /// **'Sit Tight, Your images are uploading'**
  String get media_uploading_content;

  /// Title for error uploading images
  ///
  /// In en, this message translates to:
  /// **'Error Uploading Images'**
  String get media_error_upload_title;

  /// Message for error uploading images
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while uploading your images:'**
  String get media_error_upload_message;

  /// Confirmation message for deleting image
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this image?'**
  String get media_delete_confirm;

  /// Title for successful image deletion
  ///
  /// In en, this message translates to:
  /// **'Image Deleted'**
  String get media_delete_success_title;

  /// Message for successful image deletion
  ///
  /// In en, this message translates to:
  /// **'Image successfully deleted from your cloud storage'**
  String get media_delete_success_message;

  /// Menu item for changing language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Loading message during login
  ///
  /// In en, this message translates to:
  /// **'Logging Admin account...'**
  String get loginLoadingMessage;

  /// Loading message during registration
  ///
  /// In en, this message translates to:
  /// **'Registering Admin account...'**
  String get registerLoadingMessage;

  /// Title for authorization error
  ///
  /// In en, this message translates to:
  /// **'Not Authorized'**
  String get notAuthorized;

  /// Message for authorization error
  ///
  /// In en, this message translates to:
  /// **'You are not authorized or do not have access. Contact Admin'**
  String get notAuthorizedMessage;

  /// Generic error title
  ///
  /// In en, this message translates to:
  /// **'Oh Snap'**
  String get ohSnap;

  /// Success message for admin registration
  ///
  /// In en, this message translates to:
  /// **'Admin Account Created'**
  String get adminAccountCreated;

  /// Detailed success message for admin registration
  ///
  /// In en, this message translates to:
  /// **'Admin account has been successfully created'**
  String get adminAccountCreatedMessage;

  /// Success message for login
  ///
  /// In en, this message translates to:
  /// **'Login Successful'**
  String get loginSuccess;

  /// Detailed success message for login
  ///
  /// In en, this message translates to:
  /// **'Welcome back, Admin!'**
  String get loginSuccessMessage;

  /// Network connection error title
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get networkError;

  /// Network connection error message
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again'**
  String get networkErrorMessage;

  /// Form validation error title
  ///
  /// In en, this message translates to:
  /// **'Form Validation Error'**
  String get formValidationError;

  /// Form validation error message
  ///
  /// In en, this message translates to:
  /// **'Please fill in all required fields correctly'**
  String get formValidationErrorMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
