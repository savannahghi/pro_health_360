// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';

void main() {
  test('BottomNavIndex returns the correct index', () {
    expect(BottomNavIndex.home.index, 0);
    expect(BottomNavIndex.feed.index, 1);
  });

  test('bottomNavItems returns the right Nav items', () {
    expect(bottomNavItems.length, 4);

    expect(
      bottomNavItems[0].text,
      'Home',
    );
    expect(
      bottomNavItems[1].text,
      'Feed',
    );
  });
}
