import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/constant/style.dart';
import 'package:individual_project/home/block/ganre_cubit.dart';
import 'package:individual_project/home/block/ganre_state.dart';
import 'package:individual_project/home/widget/movie/movie_page.dart';
import 'package:individual_project/model/ganre.dart';

class GanreView extends StatefulWidget {
  final double height, width;

  const GanreView({
    Key? key,
    required this.height,
    required this.width}) : super(key: key);

  @override
  _GanreViewState createState() => _GanreViewState();
}

class _GanreViewState extends State<GanreView> {
  int selectedGanre = 28;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GanreMovieCubit,GanreState>(
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
              List<Ganre> genres = state.ganreMovieList;
              return SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    Ganre ganre = genres[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Ganre genre = genres[index];
                                selectedGanre = genre.id;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ),
                                borderRadius: circularBorder,
                                color: (ganre.id == selectedGanre)
                                    ? Colors.black45
                                    : Colors.white,
                              ),
                              child: Text(
                                ganre.name.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: (ganre.id == selectedGanre)
                                      ? Colors.white
                                      : Colors.black45,

                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              );
            }else{
              return Container();
            }
          },
        ),

        MoviePage(key: UniqueKey(),
          selectedGanre: selectedGanre,
          query: '',
          height: widget.height,
          width: widget.width),
      ],
    );
  }


}

