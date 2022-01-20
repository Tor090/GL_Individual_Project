import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/ganre_cubit.dart';
import 'package:individual_project/home/widget/movie/movie_page.dart';
import 'package:individual_project/model/ganre.dart';

class GanreView extends StatefulWidget {
  final String query;
  final double height, width;

  const GanreView({
    Key? key,
    required this.query,
    required this.height,
    required this.width}) : super(key: key);

  @override
  _GanreViewState createState() => _GanreViewState();
}

class _GanreViewState extends State<GanreView> {
  GanreMovieCubit ganreMovieCubit = GanreMovieCubit();
  int selectedGanre = 28;

  @override
  void initState() {
    ganreMovieCubit.createGanreMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GanreMovieCubit,List<Ganre>>(
          bloc: ganreMovieCubit,
            builder: (context, state) {
              List<Ganre> ganres = state;
              return Container(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ganres.length,
                  itemBuilder: (context, index) {
                    Ganre ganre = ganres[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Ganre genre = ganres[index];
                                selectedGanre = genre.id;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
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
            },),

        MoviePage(key: UniqueKey(),
          selectedGanre: selectedGanre,
          query: widget.query,
          height: widget.height,
          width: widget.width),
      ],
    );
  }


}
