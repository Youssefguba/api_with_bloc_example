import 'package:api_with_bloc/cubits/home_cubit/home_cubit.dart';
import 'package:api_with_bloc/models/home_reponse_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/flash_sale_product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {

            if (state is LoadingHomeState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeDataSuccess) {
              final banners = state.homeResponse.data.banners;
              final products = state.homeResponse.data.products;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // search bar
                    _searchBarWidget(context),

                    //  slider
                    _sliderWidget(banners),

                    // category
                    _categoryWidget(),

                    // flash sale products
                    _flashSaleWidget(products),
                  ],
                ),
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _searchBarWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search Product',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border_rounded),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.notifications_none_rounded),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _sliderWidget(List<BannerModel> banners) {
    return Container(
      margin: EdgeInsets.all(8),
      child: CarouselSlider(
        options: CarouselOptions(height: 200.0),
        items: banners.map((bannerItem) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  bannerItem.image,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _categoryWidget() {
    return Container();
  }

  Widget _flashSaleWidget(List<ProductModel> products) {
    return Container(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          final productItem = products[index];
          return FlashSaleProductWidget(product: productItem);
        },
      ),
    );
  }
}
