import 'package:payment_process/classes/balance.dart';

abstract class PaymentMethod
{
  bool makePayment(double amount, Balance balance);
  bool cancelPayment(double amount, Balance balance);
}

class CreditCard implements PaymentMethod{
  @override
  bool cancelPayment(double amount, Balance balance) {
    print("canceling payment....");
    print("new balance state: ${balance.getBalance()} and ${balance.getCredit()}");
    return true;
  }

  @override
  bool makePayment(double amount, Balance balance) {
    print("making payment....");
    print("balance state ${balance.getBalance()} and ${balance.getCredit()}");
    if(balance.getBalance() - amount > 0)
      {
        balance.setBalance(balance.getBalance() - amount);
      }
      else {
      if (balance.getBalance() > 0) {
        amount -= balance.getBalance();
      }
      if (balance.getCredit() + amount < 200) {
        balance.setCredit(balance.getCredit() + amount);
        balance.setBalance(0);
      } else {
        cancelPayment(amount, balance);

        return false;
      }
    }

    print("new balance state: ${balance.getBalance()} and ${balance.getCredit()}");

    return true;

  }

  
}

class CustomerOrder {
  PaymentMethod _paymentMethod;

  CustomerOrder(this._paymentMethod);

  bool makePayment(double amount, Balance balance) {
    return _paymentMethod.makePayment(amount, balance);
  }
}