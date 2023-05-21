import 'package:clean_archtecture_base/presentaition/home/cubit/home_cubit.dart';
import 'package:clean_archtecture_base/presentaition/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/drawer.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);
  static const routeName = '/home-page';
  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      // if (state is HomepageUserLoadedState) {
      //   context.read<HomepageBloc>().add(
      //         const HomepageGetProductEvent(),
      //       );
      // }
    }, builder: (context, state) {
      return Scaffold(
        drawer:
            state is HomeLoadedState ? HomepageDrawer(user: state.user) : null,
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: state is HomeLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is HomeLoadedState
                ? ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      final item = state.productList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.thumbnail),
                        ),
                        title: Text(item.title),
                        subtitle: Text(
                          item.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  )
                : Container(),
      );
    });
  }
}
