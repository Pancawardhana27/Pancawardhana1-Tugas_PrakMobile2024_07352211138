import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      "name": "Burger Double Keju",
      "brand": "McDonalds",
      "price": 80000,
      "quantity": 0,
      "image": 'assets/images/burger1 (5).jpg'
    },
    {
      "name": "Paket Hemat",
      "brand": "McDonalds",
      "price": 100000,
      "quantity": 0,
      "image": 'assets/images/burger1 (13).jpg'
    },
    {
      "name": "Bubur Ayam",
      "brand": "McDonalds",
      "price": 50000,
      "quantity": 0,
      "image": 'assets/images/burger1 (11).jpg'
    },
    {
      "name": "Es Cream",
      "brand": "McDonalds",
      "price": 30000,
      "quantity": 0,
      "image": 'assets/images/burger1 (8).jpg'
    },
  ];

  double get subtotal {
    return _cartItems.fold(
        0.0,
        (total, item) =>
            total + (item["price"] ?? 0) * (item["quantity"] ?? 0));
  }

  double discount = 0.30; // 30% diskon
  double deliveryCharges = 2000; // Rp 2.000

  @override
  Widget build(BuildContext context) {
    double discountAmount = subtotal * discount;
    double total = subtotal - discountAmount + deliveryCharges;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // Tampilkan halaman bantuan
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Tampilkan pengaturan
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Daftar Item Keranjang
          Expanded(
            child: _cartItems.isEmpty
                ? Center(child: Text("Keranjang Anda kosong"))
                : ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(item["image"],
                                  width: 70, height: 70, fit: BoxFit.cover),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item["name"],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text(item["brand"],
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                    Text("Rp ${item["price"]}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 18, 182, 10))),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (item["quantity"] > 1) {
                                              item["quantity"]--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              shape: BoxShape.circle),
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(Icons.remove,
                                              size: 16),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text("${item["quantity"]}",
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            item["quantity"]++;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              shape: BoxShape.circle),
                                          padding: const EdgeInsets.all(8),
                                          child:
                                              const Icon(Icons.add, size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        _cartItems.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Ringkasan Pesanan
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ringkasan Pesanan",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Item"),
                    Text("${_cartItems.length}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("Rp ${subtotal.toStringAsFixed(0)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Diskon (30%)"),
                    Text("-Rp ${discountAmount.toStringAsFixed(0)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Biaya Pengiriman"),
                    Text("Rp ${deliveryCharges.toStringAsFixed(0)}"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Rp ${total.toStringAsFixed(0)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke layar checkout
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutScreen(total: total)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color.fromARGB(255, 255, 230, 0),
                  ),
                  child: const Center(
                      child: Text("Masukan ke Keranjang",
                          style: TextStyle(fontSize: 16))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutScreen extends StatefulWidget {
  final double total;

  const CheckoutScreen({super.key, required this.total});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod;

  final List<String> paymentMethods = ['Kartu Kredit', 'Dana', 'Transfer Bank'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Konfirmasi Pembayaran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text("Total Bayar: Rp ${widget.total.toStringAsFixed(0)}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text("Pilih Metode Pembayaran:",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ...paymentMethods.map((method) {
              return ListTile(
                title: Text(method),
                leading: Radio<String>(
                  value: method,
                  groupValue: selectedPaymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: selectedPaymentMethod == null
                  ? null
                  : () {
                      // Simulasikan proses pembayaran
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrderConfirmationScreen(total: widget.total)),
                      );
                    },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                backgroundColor: const Color.fromARGB(255, 255, 234, 2),
              ),
              child:
                  const Text("Bayar Sekarang", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationScreen extends StatelessWidget {
  final double total;

  const OrderConfirmationScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konfirmasi Pesanan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Terima kasih atas pesanan Anda!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text("Total pembayaran Anda: Rp ${total.toStringAsFixed(0)}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text("Pesanan Anda akan segera diproses.",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman utama atau halaman lainnya
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text("Kembali ke Beranda",
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
