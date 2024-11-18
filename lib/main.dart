import 'package:e_commerce/widget/BigCard.dart';
import 'package:e_commerce/widget/CartScreen.dart';
import 'package:e_commerce/widget/ProductCard.dart';
import 'package:e_commerce/widget/SectionHeader.dart';
import 'package:flutter/material.dart';
import 'widget/TopSeller.dart';
import 'widget/TopService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "McDonalds",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            title: const Center(
              child: Text(
                'McDonalds', // Judul aplikasi
                style: TextStyle(fontSize: 22),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            // Search bar dan kotak persegi di bawah navbar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari Menu',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: const Color.fromARGB(255, 226, 226, 226),
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  // Kotak persegi
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2, 3, 5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.filter_alt,
                        color: Color.fromARGB(255, 252, 194, 3)),
                  ),
                ],
              ),
            ),

            // Hero Section dengan Gradient Background di bawah search bar
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 300, // Tinggi Hero section
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 145, 145, 145),
                    Color.fromARGB(255, 12, 12, 12)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  // Bagian kiri dengan teks
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Promo Bulanan',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 252, 250, 250),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'DISKON 30%',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 187, 0),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Temukan menu pilihan terbaik kamu dengan penawaran yang menarik. Potongan 30% hanya untuk bulan november. Jangan sampai terlewatkan!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(
                            height: 16), // Jarak antara teks dan tombol
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 196, 0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'beli Sekarang',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 10, 10, 10)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 200, // Lebar gambar
                    height: 200, // Tinggi gambar
                    child: Image.asset(
                      'assets/images/burger1 (3).png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SectionHeader("Top Menu"),
                  const SizedBox(height: 40),
                  Container(
                    height: 170,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopSeller(
                            'assets/images/burger1 (13).jpg', 'Toko 1', 4.5),
                        TopSeller(
                            'assets/images/burger1 (5).jpg', 'Toko 2', 4.7),
                        TopSeller(
                            'assets/images/burger1 (11).jpg', 'Toko 3', 4.5),
                        TopSeller(
                            'assets/images/burger1 (2).jpg', 'Toko 4', 4.8),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SectionHeader("Menu Spesial "),

            TopService(
              'assets/images/burger1 (13).jpg',
              'assets/images/burger1 (3).png',
              4.5,
            ),
            TopService(
              'assets/images/burger1 (2).jpg',
              'assets/images/burger1 (3).png',
              4.8,
            ),

            SectionHeader("Spesial Menu Harga"),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(5.0),
              height: 270,
              width: 370,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 208, 208, 208),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Bagian kiri dengan teks
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Ambil Promonya Hari ini',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Diskon 30%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Temukan menu pilihan terbaik kamu dengan penawaran yang menarik. Potongan 30% hanya untuk bulan november. Jangan sampai terlewatkan!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '16:40:11',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                            height: 12), // Jarak antara teks dan tombol
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cek Disini',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 253, 199, 2)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 200, // Lebar gambar
                    height: 180, // Tinggi gambar
                    child: Image.asset(
                      'assets/images/burger1 (1).png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 19),
            const BigCard(
              imagePath: 'assets/images/burger1 (5).jpg',
            ),
            const SizedBox(height: 19),
            const BigCard(
              imagePath: 'assets/images/burger1 (6).jpg',
            ),

            // Services List
            const SizedBox(height: 16),
            SectionHeader("Menu Terbaru"),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap:
                    true, // Agar grid tidak scrollable, karena sudah ada SingleChildScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // Agar hanya scroll di SingleChildScrollView
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 16.0, // Jarak antar kolom
                mainAxisSpacing: 16.0, // Jarak antar baris
                childAspectRatio: 0.70, // Rasio tinggi dan lebar card
                children: [
                  ProductCard(
                    imagePath: 'assets/images/burger1 (5).jpg',
                    productName: 'Menu 1',
                    productPrice: 'Rp 150.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/burger1 (11).jpg',
                    productName: 'Menu 2',
                    productPrice: 'Rp 120.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/burger1 (10).jpg',
                    productName: 'Menu 3',
                    productPrice: 'Rp 180.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/burger1 (9).jpg',
                    productName: 'Menu 4',
                    productPrice: 'Rp 120.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/burger1 (7).jpg',
                    productName: 'Menu 5',
                    productPrice: 'Rp 1400.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/burger1 (8).jpg',
                    productName: 'Menu 6',
                    productPrice: 'Rp 160.000',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Tetapkan indeks untuk tampilan default
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
