class Balance {
  double finalBalance;
  double candidateBalance;
  int finalRolls;
  int candidateRolls;
  Balance(this.finalBalance, this.candidateBalance, this.finalRolls,
      this.candidateRolls);

  @override
  String toString() {
    return 'final balance: $finalBalance, candidate candidate: $candidateBalance, final rolls: $finalRolls, candicate roll: $candidateRolls';
  }
}
