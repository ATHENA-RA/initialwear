import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Define el CounterCubit
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state < 10) {
      emit(state + 1);
    } else {
      showToast("Maximum limit reached");
    }
  }

  void decrement() {
    if (state > -10) {
      emit(state - 1);
    } else {
      showToast("Minimum limit reached");
    }
  }

  void reset() => emit(0);

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => counterCubit.increment(),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 5),
            const CountText(),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => counterCubit.decrement(),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => counterCubit.reset(),
              child: const Icon(Icons.loop),
            ),
          ],
        ),
      ),
    );
  }
}

class CountText extends StatelessWidget {
  const CountText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) {
        return Text('$count', style: const TextStyle(fontSize: 24.0));
      },
    );
  }
}
