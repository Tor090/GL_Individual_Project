import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/ganre_cubit.dart';
import 'package:individual_project/home/widget/ganre_display/ganre_view.dart';

class GanrePage extends StatelessWidget {

  final double height, width;

  const GanrePage({required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => GanreMovieCubit(),
        child: GanreView(height: height,width: width));
  }
}