import 'package:cat_app/core/constants/color_constants.dart';
import 'package:cat_app/core/constants/string_constants.dart';
import 'package:cat_app/core/utils/text/text_generator_widget.dart';
import 'package:cat_app/features/home/presentation/bloc/cat_bloc.dart';
import 'package:cat_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextStyleGenerator(
          text: AppStrings.titleAppBar,
          fontSize: 22,
          color: AppColors.grey,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<CatBloc>()..add(GetCatProductEvent()),
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            return state.failureOrProductOption.fold(
              () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              (failureOrGetProducts) {
                return failureOrGetProducts.fold(
                  (_) {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .1,
                        child: const TextStyleGenerator(
                          text: AppStrings.errorTitle,
                          color: AppColors.errorColor,
                        ),
                      ),
                    );
                  },
                  (catModel) {
                    return MasonryGridView.builder(
                      itemCount: catModel.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .4,
                                  child: Center(
                                      child: TextStyleGenerator(
                                    text:
                                        "The Image Id : ${catModel[index].id}",
                                    fontSize: 22,
                                  )),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.network(
                              catModel[index].url.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
