import 'package:appcoba/app/models/orders.dart';
import 'package:vania/vania.dart';

class OrdersController extends Controller {

     Future<Response> index() async {

      final listorder = await Orders().query().get();

      return Response.json({
        'message' : 'order ditemukan',
        'data' :listorder,
        });
     }

     Future<Response> create() async {
          return Response.json({});
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

     Future<Response> update(Request request,int id) async {
          return Response.json({});
     }

     Future<Response> destroy(int id) async {
          return Response.json({});
     }
}

final OrdersController ordersController = OrdersController();

