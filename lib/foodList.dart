List list = <Food>[];
double total = 0;

class Food {
  String? heroTag;
  String? foodName;
  double? foodPrice;
  int? number;

  Food({this.heroTag, this.foodName, this.foodPrice, this.number});

  @override
  bool operator ==(Object other) {
    return other is Food && this.foodName == other.foodName;
  }

  @override
  int get hashCode => super.hashCode;
}
