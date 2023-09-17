export 'newpassword/new_password.dart';

export 'verifycode/verify_code.dart';
export 'successchanged/success_changed.dart';

export 'sendemail/send_email.dart';

// TODO: 

// **Forgot password** 
// endpoint: `'/user/forgotpassword', methods=['POST']`
// data: `{email: str}`
// return: `{success: true/false, message: '...'}`
// gui email chua `code` de reset password

// **Reset password** 
// endpoint: `'/user/resetpassword', methods=['POST']`
// data: `{email: str, code: str, password: str}`
// return: `{success: true/false, message: '...'}`
