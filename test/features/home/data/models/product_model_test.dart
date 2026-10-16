import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

void main() {
  test('selects a valid image from the API image list', () {
    final product = ProductModel.fromJson({
      'id': 1,
      'title': 'Product',
      'description': 'Description',
      'price': 10,
      'images': ['invalid', '["https://example.com/product.png"]'],
    });

    expect(product.imageUrl, 'https://example.com/product.png');
  });

  test('uses the fallback when the API has no valid image', () {
    final product = ProductModel.fromJson({
      'id': 1,
      'title': 'Product',
      'description': 'Description',
      'price': 10,
      'images': ['invalid'],
    });

    expect(product.imageUrl, 'https://placehold.co/600x600/png?text=Product');
  });
}
