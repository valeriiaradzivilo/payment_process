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


    return true;
  }

  @override
  bool makePayment(double amount, Balance balance) {
    print("making payment....");
    if(balance.getBalance() - amount > 0)
      {
        balance.setBalance(balance.getBalance() - amount);
      }
    else{
      if(balance.getBalance()>0)
        {
          amount-=balance.getBalance();
          balance.setBalance(0);
        }
        balance.setCredit(balance.getCredit()+amount);
    }

    return true;

  }

  
}

class CustomerOrder {
  PaymentMethod _paymentMethod;

  CustomerOrder(this._paymentMethod);

  void makePayment(double amount, Balance balance) {
    _paymentMethod.makePayment(amount, balance);
  }
}