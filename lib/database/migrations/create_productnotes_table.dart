import 'package:vania/vania.dart';

class CreateProductnotesTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('productnotes', () {
      id();
      bigInt('prod_id', unsigned: true);
      date('note_date');
      text('note_text');
      foreign('id', 'products', 'id', constrained: true, onDelete: 'CASCADE');
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('productnotes');
  }
}
