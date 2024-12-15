import 'package:vania/vania.dart';
import 'package:appcoba/app/models/user.dart';

class UserController extends Controller {
  /// Fetch user details
  Future<Response> index() async {
    Map<String, dynamic>? details =
        await User().query().where('id', '=', Auth().id()).first();

    return Response.json(details);
  }

  /// Update curent user details
  Future<Response> update(Request request) async {
    request.validate({
      'username': 'required|max_length:20',
      'email': 'required|email',
    }, {
      'username.required': 'The first name is required',
      'email.required': 'The email is required',
      'email.email': 'The email is not valid',
    });

    await User().query().where('id', '=', Auth().id()).update({
      'username': request.input('username'),
      'email': request.input('email'),
    });

    return Response.json({'message': 'User updated successfully'});
  }
}

final UserController userController = UserController();

