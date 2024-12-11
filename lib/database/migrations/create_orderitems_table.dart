import 'package:vania/vania.dart';

class CreateOrderitemsTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('orderitems', () {
      id();
      bigInt('order_num', unsigned: true);
      bigInt('prod_id', unsigned: true);
      integer('quantity');
      integer('size');
      foreign('order_num', 'orders', 'id', constrained: true, onDelete: 'CASCADE');
      foreign('prod_id', 'products', 'id', constrained: true, onDelete: 'CASCADE');
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orderitems');
  }
}
