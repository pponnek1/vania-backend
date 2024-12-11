import 'package:vania/vania.dart';

class CreateCustomerTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('customer', () {
      id();
      string('cust_name');
      string('cust_address');
      string('cust_city');
      string('cust_state');
      string('cust_zip');
      string('cust_country');
      string('cust_telp');
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('customer');
  }
}
