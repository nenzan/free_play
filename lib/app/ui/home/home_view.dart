import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:free_play/app/ui/home/home_vm.dart';
import 'package:free_play/core/data/enum/view_type_enum.dart';
import 'package:free_play/core/style/app_color.dart';
import 'package:free_play/core/style/app_values.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/pmvvm.dart';

import 'model/image_model.dart';

final List<String> imgList = [
  'https://gamebrott.com/wp-content/uploads/2020/02/Diablo-Immortal-image-696x344-1.jpg',
  'https://gamebrott.com/wp-content/uploads/2020/06/capsule_616x353.jpg',
  'https://cms.hybrid.co.id/wp-content/uploads/2016/05/dota2.jpg',
  'https://i0.wp.com/gamehall.com.br/wp-content/uploads/2019/09/league-newlogo-banner.jpg?fit=1280%2C720&ssl=1',
  'https://w0.peakpx.com/wallpaper/787/769/HD-wallpaper-pokemon-go-original-cover-pokemon-go-games-pokemon.jpg',
  'https://cdn-2.tstatic.net/newsmaker/foto/bank/images/cover-game-ragnarok-x-next-generatoin.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeVm>(
      view: () => _HomeScreenView(),
      viewModel: HomeVm(),
    );
  }
}

class _HomeScreenView extends StatelessView<HomeVm> {
  int _crossAxisCount = 2;

  double _aspectRatio = 1.5;

  ViewType _viewType = ViewType.grid;

  List<ImageData> itemList = getImageDataList();

  static List<ImageData> getImageDataList() {
    return [
      ImageData(
          'https://images.unsplash.com/photo-1467733037332-340204cb229b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=875&q=80',
          'Shinny Sunflower',
          '01-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1432316212565-b26e2a381ada?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=875&q=80',
          'Awesome Sunflower',
          '01-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1541214240140-980ad45caeb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'Amazing Nature',
          '02-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1517241080758-95a42c519c1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'Bright Sunflower',
          '02-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1437275537121-331a0457c8d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'Pink Flowers',
          '03-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
          'Clear Nature',
          '03-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1421930866250-aa0594cea05c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
          'Fresh Nature',
          '04-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1481595357459-84468f6eeaac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'Flying Insect',
          '04-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1536693308398-d4c2caf33e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'Natures Gift',
          '05-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1545560928-ba585ef97070?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
          'Lilly Garden',
          '05-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1436891436013-5965265af5fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'Fresh Lilly',
          '06-Jan-2022'),
      ImageData(
          'https://images.unsplash.com/photo-1560738851-47a1bd7288a4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          'White Lilly',
          '06-Jan-2022')
    ];
  }

  @override
  Widget render(BuildContext context, HomeVm viewModel) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              centerTitle: false,
              backgroundColor: Color(0xFF313640),
              title: const Text('Free Play'),
              actions: [
                Container(
                  width: 200,
                  height: 40,
                  margin: EdgeInsets.only(
                      right: AppValues.size_8,
                      bottom: AppValues.size_8,
                      top: AppValues.size_8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppValues.size_16),
                      color: Color(0xFF21242a)),
                  child: Center(
                    child: TextFormField(
                        style: const TextStyle(color: AppColors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Here...',
                          hintStyle: TextStyle(color: AppColors.greyChartLabel),
                          labelStyle: TextStyle(color: AppColors.white),
                          prefix: SizedBox(
                            width: AppValues.size_16,
                          ),
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: AppColors.white,
                          ),
                        )),
                  ),
                )
              ],
            )
          ];
        },
        body: Scaffold(
          backgroundColor: Color(0xFF21242a),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: imageSliders,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Free Game',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(_viewType == ViewType.list
                          ? Icons.grid_view_sharp
                          : Icons.list_rounded, color: AppColors.white),
                      onPressed: () {
                        if (_viewType == ViewType.list) {
                          _crossAxisCount = 2;
                          _aspectRatio = 1.5;
                          _viewType = ViewType.grid;
                        } else {
                          _crossAxisCount = 1;
                          _aspectRatio = 5;
                          _viewType = ViewType.list;
                        }
                        viewModel.notifyListeners();
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: AppValues.size_16, right: AppValues.size_16, bottom: AppValues.size_16),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: _crossAxisCount,
                        childAspectRatio: _aspectRatio,
                        children: itemList.map((ImageData imageData) {
                          return getGridItem(imageData);
                        }).toList(),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  GridTile getGridItem(ImageData imageData) {
    return GridTile(
      child: (_viewType == ViewType.list)
          ? Container(
              margin: EdgeInsets.only(top: AppValues.size_8),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageData.path,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        imageData.title,
                        style: const TextStyle(
                            fontSize: 20, color: AppColors.white),
                      ),
                      Text(
                        imageData.date,
                        style: const TextStyle(
                            fontSize: 15, color: AppColors.white),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageData.path,
                        ))),
                Text(
                  imageData.title,
                  style: const TextStyle(fontSize: 15, color: AppColors.white),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
    );
  }
}
