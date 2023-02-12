class Balance{
  late double _balanceState;
  late double _creditState;

  Balance(double balanceState, double creditState)
  {
    _balanceState = balanceState;
    _creditState = creditState;
  }

  setBalance(double balanceState)
  {
    _balanceState = balanceState;
  }

  setCredit(double creditState)
  {
    _creditState = creditState;
  }


  double getBalance()
  {
    return _balanceState;
  }

  double getCredit()
  {
    return _creditState;
  }



}