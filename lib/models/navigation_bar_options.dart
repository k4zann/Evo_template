class NavigationBarOptions {
  String name;
  String iconPath;

  NavigationBarOptions({
    required this.name,
    required this.iconPath,
  });

  static List<NavigationBarOptions> getNavigationBarOptions() {
    List<NavigationBarOptions> navigationBar = [];
    navigationBar.add(
        NavigationBarOptions(
          name: 'Home',
          iconPath: 'assets/icons/home.png',
        )
    );
    navigationBar.add(
        NavigationBarOptions(
          name: 'Profile',
          iconPath: 'assets/icons/home.png',
        )
    );
    navigationBar.add(
        NavigationBarOptions(
          name: 'Time',
          iconPath: 'assets/icons/time.png',
        )
    );
    navigationBar.add(
        NavigationBarOptions(
          name: '',
          iconPath: 'assets/icons/hamburg.png',
        )
    );

    return navigationBar;
  }
}
