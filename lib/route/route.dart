class TRoutes {
  static const login = '/login';
  static const forgetPassword = '/forget-password';
  static const resetPassword = '/reset-password';

  static const dashboard = '/dashboars';
  static const media = '/media';

  static const banners = '/banners';
  static const createBanner = '/createBanner';
  static const editBanner = '/editBanner';

  static const products = '/products';
  static const createProduct = '/createProduct';
  static const editProduct = '/editProduct';

  static const categories = '/categories';
  static const createCategory = '/ceateCategory';
  static const editCategory = '/editCategory';

  static const firstScreen = '/';
  static const reponsiveDesignTutoralScreen = '/responsive-design-tutorial';
  static const secondScreen = '/second-screen';
  static const secondScreenWithUID = '/second-screen/:userId';

  static List sidebarMenuItems = [
    firstScreen,
    reponsiveDesignTutoralScreen,
    login,
    secondScreen,
    forgetPassword,
    resetPassword,
    secondScreenWithUID,
  ];
}
