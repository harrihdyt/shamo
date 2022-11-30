part of 'pages.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
  ];

  List familiarShoes = [
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
    'assets/detail_shoes.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :\)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left_rounded,
                    ),
                  ),
                  Icon(
                    Icons.shopping_bag_rounded,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: images
                  .map((images) => Image.asset(
                        images,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(index);
              }).toList(),
            ),
          ],
        ),
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              24,
            ),
          ),
          color: backgroundColor1,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // !header

              Container(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adidas Number',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Training',
                            style: secondaryTextStyle.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isWishlist = !isWishlist;
                        });
                        if (isWishlist) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: secondaryColor,
                              content: Text(
                                'Has been added to the Wishlist',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: alertColor,
                              content: Text(
                                'Has been remove from the Wishlist',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        isWishlist
                            ? 'assets/button_wishlist_active.png'
                            : 'assets/button_wishlist.png',
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),

              // !Price
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price start from',
                        style: primaryTextStyle,
                      ),
                      Text(
                        'Rp. 1.500.000',
                        style: priceTextStyle
                          ..copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                      )
                    ]),
              ),

              // ! Descriptions
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                      style: subtitleTextStyle.copyWith(
                        fontWeight: light,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              //! Familiar Shoes

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Text(
                        'Familiar Shoes',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: familiarShoes.map((image) {
                          index++;
                          return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0,
                              ),
                              child: familiarShoesCard(image));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // !Button
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(
                  defaultMargin,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail-chat');
                      },
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/button_chat.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        height: 54,
                        child: TextButton(
                          onPressed: () {
                            showSuccessDialog();
                          },
                          child: Text(
                            'Add to Cart',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 65,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor6,
        body: ListView(
          children: [
            header(),
            content(),
          ],
        ));
  }
}
