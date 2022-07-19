import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletetTx;
  const TransactionList(this.transaction, this.deletetTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              Text(
                "No Transaction Here",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 6,
                margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          ' ₹' + transaction[index].amount.toStringAsFixed(2),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction[index].title.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMd().add_jm().format(transaction[index].date),
                  ),
                  trailing: IconButton(
                      onPressed: () => deletetTx(transaction[index].id),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
              );
              // Card(
              //   color: Colors.white,
              //   child: Row(
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //                 color: Theme.of(context).primaryColor,
              //                 width: 1.5)),
              //         margin: const EdgeInsets.symmetric(
              //             vertical: 10, horizontal: 15),
              //         child: Text(
              //           ' ₹' + transaction[index].amount.toStringAsFixed(2),
              //           style: const TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Colors.red),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transaction[index].title,
              //             style: const TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //             DateFormat.yMd()
              //                 .add_jm()
              //                 .format(transaction[index].date),
              //             style: const TextStyle(color: Colors.grey),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // );
            },
            itemCount: transaction.length,
          );
  }
}

// import 'package:expenses/transactions.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transactions> transaction;
//   TransactionList(this.transaction);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: Column(
//         children: transaction.map((t1) {
//           return Card(
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.purple, width: 1.5)),
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   child: Text(
//                     ' ₹' + t1.amount.toString(),
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.purple),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       t1.title,
//                       style: const TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       DateFormat.yMd().add_jm().format(t1.date),
//                       style: const TextStyle(color: Colors.grey),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }