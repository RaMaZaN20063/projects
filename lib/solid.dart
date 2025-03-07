abstract class Database {
  void saveOrder(String order);
}
class FirebaseDatabase implements Database {
  @override
  void saveOrder(String order) {
    print("Сохранение заказа в Firebase: $order");
  }
}

class OrderService {
  final Database database;

  OrderService(this.database);

  void placeOrder(String order) {
    print("Заказ оформлен: $order");
    database.saveOrder(order);
  }
}

class LocalDatabase implements Database {
  @override
  void saveOrder(String order) {
    print("Сохранение заказа локально: $order");
  }
}

void main() {
  Database firebaseDB = FirebaseDatabase();
  OrderService orderService = OrderService(firebaseDB);

  orderService.placeOrder("Бургер и кола 🍔🥤");

  Database localDB = LocalDatabase();
  orderService = OrderService(localDB);
  orderService.placeOrder("Пицца и сок 🍕🧃");
}
