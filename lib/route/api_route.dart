import 'package:appcoba/app/http/controllers/customer_controller.dart';
import 'package:appcoba/app/http/controllers/orderitems_controller.dart';
import 'package:appcoba/app/http/controllers/orders_controller.dart';
import 'package:appcoba/app/http/controllers/product_controller.dart';
import 'package:appcoba/app/http/controllers/productnotes_controller.dart';
import 'package:appcoba/app/http/controllers/vendors_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.get('/customer', customerController.index);
    Router.get('/customer/{id}', customerController.show);
    Router.post('/customer/create', customerController.create); 
    Router.put('/customer/update', customerController.update);
    Router.delete('/customer/delete', customerController.destroy);

    Router.get('/orderitems', orderitemsController.index);
    Router.get('/orderitems/{id}', orderitemsController.show);
    Router.post('/orderitems/create', orderitemsController.create);
    Router.put('/orderitems/update', orderitemsController.update);
    Router.delete('/orderitems/delete', orderitemsController.destroy);

    Router.get('/products', productController.index);
    Router.get('/products/{id}', productController.show);
    Router.post('/products/create', productController.create);
    Router.put('/products/update', productController.update);
    Router.delete('/products/delete', productController.destroy);

    Router.get('/orders', ordersController.index);
    Router.get('/orders/{id}', ordersController.show);
    Router.post('/orders/create', ordersController.create);
    Router.put('/orders/update', ordersController.update);
    Router.delete('/orders/delete', ordersController.destroy);

    Router.get('/vendors', vendorsController.index);
    Router.get('/vendors/{id}', vendorsController.show);
    Router.post('/vendors/create', vendorsController.create);
    Router.put('/vendors/update', vendorsController.update);
    Router.delete('/vendors/delete', vendorsController.destroy);
    
    Router.get('/productnotes', productnotesController.index);
    Router.get('/productnotes/{id}', productnotesController.show);
    Router.post('/productnotes/create', productnotesController.create);
    Router.put('/productnotes/update', productnotesController.update);
    Router.delete('/productnotes/delete', productnotesController.destroy);
  }
}
