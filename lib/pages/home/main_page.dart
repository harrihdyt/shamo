part of 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  //! Cart Bottom
  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  Widget customeBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          30,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: backgroundColor4,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            print(value);
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset(
                  'assets/icon_home.png',
                  color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                  width: 21,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset(
                  'assets/icon_chat.png',
                  color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                  width: 20,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset(
                  'assets/icon_wishlist.png',
                  color: currentIndex == 2 ? primaryColor : Color(0xff808191),
                  width: 20,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset(
                  'assets/icon_profile.png',
                  color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                  width: 18,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }

  body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
        break;
      case 1:
        return ChatPage();
        break;
      case 2:
        return WishlistPage();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customeBottomNavigationBar(),
      body: body(),
    );
  }
}
