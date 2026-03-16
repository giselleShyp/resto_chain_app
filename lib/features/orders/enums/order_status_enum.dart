enum OrderStatus {
  preparing(0),
  onTheWay(1),
  delivered(2),
  cancelled(3);

  final int code;
  const OrderStatus(this.code);

  static OrderStatus fromCode(int code) {
    return OrderStatus.values.firstWhere(
      (e) => e.code == code,
      orElse: () => OrderStatus.preparing,
    );
  }
}

// enum OrderStatus {
//   delivered,
//   preparing,
//   onTheWay,
//   cancelled,
// }

// extension OrderStatusParser on OrderStatus {
//   static OrderStatus fromString(String status) {
//     switch (status.toLowerCase()) {
//       case 'delivered':
//         return OrderStatus.delivered;

//       case 'preparing':
//         return OrderStatus.preparing;

//       case 'ontheway':
//       case 'on_the_way':
//       case 'on the way':
//         return OrderStatus.onTheWay;

//       case 'cancelled':
//       case 'canceled':
//         return OrderStatus.cancelled;

//       default:
//         return OrderStatus.preparing;
//     }
//   }
// }
