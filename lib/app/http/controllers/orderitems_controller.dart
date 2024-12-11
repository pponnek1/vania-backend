import 'package:appcoba/app/models/orderitems.dart';
import 'package:vania/vania.dart';

class OrderitemsController extends Controller {

     Future<Response> index() async {

      final listOrderitems = await Orderitems().query().get();
        return Response.json({
          'message' : 'data order items',
          'data' : listOrderitems,
        });
     }

     Future<Response> create() async {
          return Response.json({});
     }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> show(Request req, int id) async {
      final orderitems = await Orderitems().query().where('order_item', '=', id).first();
      
      return Response.json({
        'data' : orderitems,
      });
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

final OrderitemsController orderitemsController = OrderitemsController();

