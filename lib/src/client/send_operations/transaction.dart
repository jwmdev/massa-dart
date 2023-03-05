import 'dart:typed_data';

import 'package:massa/src/client/send_operations/base_send_operation.dart';
import 'package:massa/src/crypto/common.dart';
import 'package:massa/src/crypto/varuint.dart';
import 'package:massa/src/helpers/helpers.dart';

class TransactionOperation extends BaseSendOperation {
  double amount;
  String recipientAddress;
  TransactionOperation(
      {required this.amount,
      required double fee,
      required this.recipientAddress,
      required int expirePeriod})
      : super(OperationType.transaction, fee, expirePeriod);
  @override
  Uint8List compact() {
    final feeEncoded = Varint.encode(doubleToMassaInt(fee));
    final expirePeriodEncoded = Varint.encode(expirePeriod);
    final operationTypeEncoded = Varint.encode(operationType.index);
    final recipientAddressEncoded = base58Decode(recipientAddress.substring(2));
    final amountEncoded = Varint.encode(doubleToMassaInt(amount));

    return concat([
      feeEncoded,
      expirePeriodEncoded,
      operationTypeEncoded,
      recipientAddressEncoded,
      amountEncoded
    ]);
  }
}