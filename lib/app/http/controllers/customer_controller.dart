import 'package:appcoba/app/models/customers.dart';
import 'package:vania/vania.dart';

class CustomerController extends Controller {

  Future<Response> index() async {

    final listcustomer = await Customers().query().get();
    return Response.json({
      'message' : 'data list customers',
      'data' : listcustomer,
    });
  }

  Future<Response> create(Request request) async {

    try {
      request.validate({
        'cust_name' : 'required',
        'cust_address' : 'required',
        'cust_city' : 'required',
        'cust_state' : 'required',
        'cust_zip' : 'required',
        'cust_country' : 'required',
        'cust_telp' : 'required',
      });

      final customerData = request.input();

      final exitingCustomer = await Customers().query().where('cust_telp', '=', customerData['cust_telp']).first();

      if (exitingCustomer != null) {
        return Response.json({
          'message' : 'nomor telp ini sudah terdaftar'
        }, 409);
      }
      
      customerData['created_at'] = DateTime.now().toIso8601String();

      await Customers().query().insert(customerData);

      return Response.json({
        'message' : 'customer berhasil ditambahkan',
        'data' : customerData,
      }, 201);

    } catch (e) {
      return Response.json({
        'message' : 'terjadi kesalahan',
        'error' : e.toString(),
      });
    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request, int id) async {
    final customer =
        await Customers().query().where('cust_id', '=', id).first();

    return Response.json({
      'data': customer,
    });
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

final CustomerController customerController = CustomerController();
