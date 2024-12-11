import 'package:vania/vania.dart';

class CreateOrdersTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('orders', () {
      id();
      bigInt('cust_id', unsigned: true);
      date('date');
      foreign('cust_id', 'customers', 'id', constrained: true ,onDelete: 'CASCADE');
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orders');
  }
}
