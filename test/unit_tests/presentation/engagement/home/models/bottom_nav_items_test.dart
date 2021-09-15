import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';

import 'package:test/test.dart';

void main() {
  test('BottomNavIndex returns the correct index', () {
    expect(BottomNavIndex.home.index, 0);
    expect(BottomNavIndex.library.index, 1);
    // expect(BottomNavIndex.market.index, 2);
  });
  test('bottomNavItems returns the right Nav items', () {
    expect(bottomNavItems.length, 2);

    expect(
      bottomNavItems[0].text,
      'Home',
    );
    expect(
      bottomNavItems[1].text,
      'Library',
    );
  });
}
