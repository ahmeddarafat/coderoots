import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/public_text.dart';
import '../viewmodel/products_state.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../viewmodel/prducts_cubit.dart';
import 'components/prduct_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late final ProductsCubit bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<ProductsCubit>();
    bloc.getDoctors("18");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            buildWhen: (_, current) {
              return current is LoadingState ||
                  current is SuccessState ||
                  current is ErrorState;
            },
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  success: (_) {
                    bloc.products.length;
                    return ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (_, __) =>  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: Colors.grey[300],),
                      ),
                      itemBuilder: (_, index) {
                        final doctor = bloc.products[index];
                        return ProductCard(product: doctor);
                      },
                    );
                  },
                  error: (message) {
                    return Center(
                      child: PublicText(
                        text: message,
                        color: Colors.red,
                      ),
                    );
                  },
                  orElse: () => const SizedBox.shrink());
            },
          ),
        ),
      ),
    );
  }
}
