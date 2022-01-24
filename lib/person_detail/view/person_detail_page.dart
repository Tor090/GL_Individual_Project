import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/person_detail/bloc/person_detail_cubit.dart';
import 'package:individual_project/person_detail/view/person_detail_view.dart';

class PersonDetailPage extends StatelessWidget {
  final int personId;
  const PersonDetailPage({Key? key, required this.personId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => PersonDetailCubit(personId: personId),
        child: PersonDetailView());
  }
}
