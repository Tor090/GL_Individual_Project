import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/movie_detail/widget/button_back.dart';
import 'package:individual_project/person_detail/bloc/person_detail_cubit.dart';
import 'package:individual_project/person_detail/bloc/person_detail_state.dart';

class PersonDetailView extends StatelessWidget {
  const PersonDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<PersonDetailCubit,PersonDetailState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            Person person = state.person;
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonBack(
                        onTap: () => Navigator.pop(context),
                      ),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/${person.profilePath}',
                              height: MediaQuery.of(context).size.height /2.5,
                              width: MediaQuery.of(context).size.width / 2,

                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10)),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Text(person.name, style: const TextStyle(fontSize: 22),),
                                const SizedBox(height: 10),
                                Text('Birthday: ${person.birthday}',style: const TextStyle(fontSize: 18),),
                                const SizedBox(height: 10),
                                Text('Popularity: ${person.popularity}',style: const TextStyle(fontSize: 18),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('Biography', style: TextStyle(fontSize: 22),),
                      const SizedBox(height: 10),
                      Text(person.biography,style: const TextStyle(fontSize: 18),),

                    ],
                  ),
                ),
              ),
            );
          }else{
            return throw Exception();
          }
        }
      ),
    );
  }
}
