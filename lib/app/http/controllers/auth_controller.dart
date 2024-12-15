import 'package:appcoba/app/models/user.dart';
import 'package:vania/vania.dart';
import 'package:bcrypt/bcrypt.dart';

class AuthController extends Controller {
  Future<Response> login(Request request) async {
    
    request.validate({
      'email': 'required|email',
      'password': 'required',
    }, {
      'email.required': 'The email is required',
      'email.email': 'The email is not valid',
      'password.required': 'The password is required'
    });

    
    String email = request.input('email');
    String password = request.input('password').toString();

    
    final user = await User().query().where('email', email).first();
    if (user == null) {
      return Response.json({'message': 'User not found'},
          404);
    }

    
    if (!BCrypt.checkpw(password, user['password'])) {
      return Response.json({
        'message': 'Password is incorrect',
      }, 401);
    }

    
    Map<String, dynamic> token = await Auth()
        .login(
            user)
        .createToken(expiresIn: Duration(hours: 24), withRefreshToken: true);

    
    return Response.json({
      'message': 'Login successful',
      'data': {
        'token': token,
        'user': {
          'id': user[
              'id'], 
          'email': user['email'],
          'username': user['username'] ?? 'No Username',
        },
      },
    });
  }

  Future<Response> signUp(Request request) async {
    
    request.validate({
      'username': 'required',
      'email': 'required|email',
      'password': 'required|min:6',
    }, {
      'username.required': 'Username is required',
      'email.required': 'Email is required',
      'email.email': 'Email not valid',
      'password.required': 'Password is required',
      'password.min': 'Password should be at least 6 characters',
    });

    
    String username = request.input('username');
    String email = request.input('email');
    String password = request.input('password').toString();

    
    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    
    Map<String, dynamic>? existingUser =
        await User().query().where('email', '=', email).first();
    if (existingUser != null) {
      return Response.json({'message': 'User already exists'});
    }

    
    await User().query().insert({
      'username': username,
      'email': email,
      'password': hashedPassword,
      'created_at': DateTime.now(),
    });

    
    Map<String, dynamic> newUser =
        await User().query().where('email', '=', email).first() ?? {};

    
    Map<String, dynamic> token = await Auth()
        .login(newUser) 
        .createToken(expiresIn: Duration(hours: 24), withRefreshToken: true);

    
    return Response.json({
      'error': false,
      'message': 'User registered successfully',
      'data': {
        'token': token,
        'user': {
          'id': newUser['id'],
          'username': newUser['username'],
          'email': newUser['email'],
        },
      },
    });
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({});
  }

  Future<Response> destroy(int id) async {
    return Response.json({});
  }
}

final AuthController authController = AuthController();
