enum APP_ROUTE { LOGIN, HOME, USER_PROFILE, CHATS_LIST, CHAT }

String pathForRoute(APP_ROUTE route) {
  switch (route) {
    case APP_ROUTE.LOGIN:
      return "/login";
    case APP_ROUTE.USER_PROFILE:
      return "/profile";
    case APP_ROUTE.CHATS_LIST:
      return "/chats";
    case APP_ROUTE.CHAT:
      return "/chat/";
    case APP_ROUTE.HOME:
    default:
      return "/";
  }
}
