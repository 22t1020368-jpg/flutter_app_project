import 'package:flutter/material.dart';
import 'product.dart';
import 'api.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  String errorMsg = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
    searchController.addListener(_filterProducts);
  }

  Future<void> _loadProducts() async {
    try {
      allProducts = await test_api.getAllProducts();
      filteredProducts = allProducts;
    } catch (e) {
      errorMsg = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _filterProducts() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts
            .where((p) =>
                p.title.toLowerCase().contains(query) ||
                p.description.toLowerCase().contains(query) ||
                p.category.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  int getCrossAxisCount(double width) {
    if (width >= 1200) return 5; 
    if (width >= 900) return 4;
    if (width >= 600) return 3; 
    return 2; 
  }
  String formatCurrency(dynamic number) {
    return number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA), 
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(55, 5, 22, 131),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,

        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMsg.isNotEmpty
              ? Center(child: Text(errorMsg))
              : Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm sản phẩm...',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: filteredProducts.isEmpty
                          ? const Center(
                              child: Text(
                                'Không tìm thấy sản phẩm',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            )
                          : LayoutBuilder(
                              builder: (context, constraints) {
                                int crossAxisCount =
                                    getCrossAxisCount(constraints.maxWidth);
                                double spacing = 8; 
                                double horizontalPadding = 8;
                                double itemWidth = (constraints.maxWidth - (horizontalPadding * 2) - (spacing * (crossAxisCount - 1))) / crossAxisCount;
                                double itemHeight = itemWidth + 115; 
                                double childAspectRatio = itemWidth / itemHeight;

                                return GridView.builder(
                                  padding: EdgeInsets.all(horizontalPadding).copyWith(top: 8),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    mainAxisSpacing: spacing,
                                    crossAxisSpacing: spacing,
                                    childAspectRatio: childAspectRatio, 
                                  ),
                                  itemCount: filteredProducts.length,
                                  itemBuilder: (context, index) =>
                                      _buildProductCard(filteredProducts[index]),
                                );
                              },
                            ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildProductCard(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1, 
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                p.image,
                fit: BoxFit.cover, 
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported,
                      size: 40, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13, 
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                     p.category.toUpperCase(),
                     style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),

                  const SizedBox(height: 4),              
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '₫', 
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.red, 
                          decoration: TextDecoration.underline
                        )
                      ),
                      Text(
                        formatCurrency(p.price),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red, 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}