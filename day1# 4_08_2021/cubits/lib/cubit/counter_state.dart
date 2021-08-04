part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool isIncrement;

  CounterState({required this.counterValue, this.isIncrement = false});

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.isIncrement];
}
