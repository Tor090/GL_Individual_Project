import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/person_detail/bloc/person_detail_cubit.dart';
import 'package:individual_project/person_detail/bloc/person_detail_state.dart';

class PersonDetailView extends StatelessWidget {
  const PersonDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PersonDetailCubit,PersonDetailState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            Person person = state.person;
            return Column(
              children: [
                Center(child: Text(person.name)),

              ],
            );
          }else{
            return throw Exception();
          }
        }
      ),
    );
  }
}
