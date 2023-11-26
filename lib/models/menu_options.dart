class MenuOptionsModel{
  String name;
  String iconPath;

  MenuOptionsModel({
    required this.name,
    required this.iconPath,
  });

  static List<MenuOptionsModel> getMenuOptions() {
    List<MenuOptionsModel> options = [];
    options.add(
        MenuOptionsModel(
            name: 'Эвакуация',
            iconPath: 'assets/icons/towing.png',
        )
    );
    options.add(
        MenuOptionsModel(
          name: 'Замена Колес',
          iconPath: 'assets/icons/wheel.png',
        )
    );
    options.add(
        MenuOptionsModel(
          name: 'Взлом двери',
          iconPath: 'assets/icons/key.png',
        )
    );
    return options;
  }
}
