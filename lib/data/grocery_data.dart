class GroceryProduct {
  // final String id;
  // final String name;
  // final String description;
  // final double price;
  // final String imageUrls;

  // GroceryProduct({
  //   required this.id,
  //   required this.name,
  //   required this.description,
  //   required this.price,
  //   required this.imageUrls,
  // });
// }

  static List<Map<String, dynamic>> groceryProducts = [
    {
      'id': '1',
      'name': 'Apples',
      'description': 'Fresh and juicy apples',
      'price': 1.99,
      'imageUrls':
          'https://static.libertyprim.com/files/familles/pomme-large.jpg?1569271834',
    },
    {
      'id': '2',
      'name': 'Bananas',
      'description': 'Ripe and delicious bananas',
      'price': 0.99,
      'imageUrls':
          'https://www.bobtailfruit.co.uk/pub/media/mageplaza/blog/post/4/2/42e9as7nataai4a6jcufwg.jpeg',
    },
    {
      'id': '3',
      'name': 'Carrots',
      'description': 'Crunchy and nutritious carrots',
      'price': 0.79,
      'imageUrls': 'https://bcfresh.ca/wp-content/uploads/2021/11/Carrots.jpg',
    },
    {
      'id': '4',
      'name': 'Mango',
      'description': 'Juicy Mango',
      'price': 0.79,
      'imageUrls': 'https://www.mishry.com/wp-content/uploads/2020/05/mango-5224186_1280.jpg',
    },
    // Add more grocery products as needed
  ];
}
