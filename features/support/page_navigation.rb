ScreenModel::ScreenFactory.routes = {
        default: [[WelcomeScreen, :verify_pick_teams_btn_exist]],
        nav_sign_up: [
            [WelcomeScreen, :tap_sign_in_btn],
            [SignInScreen, :tap_sign_up_btn]
        ],
        nav_forgot_pw: [
            [WelcomeScreen, :tap_sign_in_btn],
            [SignInScreen, :tap_signin_email_phone_btn],
            [SignInScreen, :tap_sign_in_email_btn],
            [GlobalScreenElements, :close_keyboard],
            [SignInScreen, :tap_forgot_pwd_link]
        ],
        nav_to_home_screen: [
            [DashboardScreen, :nav_to_home_screen]
        ]
}