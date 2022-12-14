part of 'pages.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Checkout Details'),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          //! List Items
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                CheckoutCard(),

                //! Address Details
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address Details',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/store_location.png',
                                width: 40,
                              ),
                              Image.asset(
                                'assets/line.png',
                                height: 30,
                              ),
                              Image.asset(
                                'assets/user_location.png',
                                width: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Store Location',
                                style: secondaryTextStyle.copyWith(
                                    fontWeight: light, fontSize: 12),
                              ),
                              Text(
                                'Adidas Core',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Youre Address',
                                style: secondaryTextStyle.copyWith(
                                    fontWeight: light, fontSize: 12),
                              ),
                              Text(
                                'Pantai Indah Kapuk, Jakarta',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                //! Payment Summery
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summery',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '2 Items',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Price',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rp. 3.000.000',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Free',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(
                        color: secondaryTextColor,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: priceTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Rp.3.000.000',
                            style: priceTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: secondaryTextColor,
                  thickness: 0.5,
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  height: 54,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/checkout-success', (route) => false);
                    },
                    child: Text(
                      'Checkout Now',
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
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
