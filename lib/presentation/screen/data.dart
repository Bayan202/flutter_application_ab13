import 'package:flutter/material.dart';
import 'package:flutter_application_ab9/presentation/bloc/bloc/new_bloc.dart';
import 'package:flutter_application_ab9/presentation/bloc/bloc/new_event.dart';
import 'package:flutter_application_ab9/presentation/bloc/bloc/new_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataFromAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(FetchPostEvent()),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.posts[index].title),
                  subtitle: Text(state.posts[index].body),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text('Ошибка загрузки данных.'));
          } else {
            return Center(child: Text('Начальное состояние.'));
          }
        },
      ),
    );
  }
}
