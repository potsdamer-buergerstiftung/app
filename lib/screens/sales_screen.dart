import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/services/locations/locations_service.dart';
import 'package:potsdamer_buergerstiftung/services/products/products_service.dart';
import 'package:potsdamer_buergerstiftung/widgets/header.dart';

class SalesLocationSelectionController extends GetxController {
  var isLoading = true.obs;
  var locations = <Location>[].obs;
  var selectedLocationId = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    locations.value = await LocationsService.getLocations();
    isLoading.value = false;
  }

  void selectLocation(int id) {
    selectedLocationId.value = id;
  }
}

class SalesLocationSelectionScreen extends StatelessWidget {
  SalesLocationSelectionScreen({Key? key}) : super(key: key);

  final SalesLocationSelectionController l = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (l.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: l.locations.length,
            itemBuilder: (context, index) {
              final location = l.locations[index];
              return ListTile(
                title: Text(location.name),
                onTap: () => l.selectLocation(location.id),
              );
            },
          );
        },
      ),
    );
  }
}

class SalesController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
  }

  Future<void> loadProducts() async {
    products.value = await ProductsService.getProducts();
    isLoading.value = false;
  }
}

class SalesScreen extends StatelessWidget {
  SalesScreen({Key? key}) : super(key: key);

  final SalesLocationSelectionController l =
      Get.put(SalesLocationSelectionController());

  final SalesController s = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (l.selectedLocationId.value == 0) {
          return Scaffold(
            body: SalesLocationSelectionScreen(),
          );
        }
        if (l.isLoading.value) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Sales"),
          ),
          body: ListView.builder(
            itemCount: s.products.length,
            itemBuilder: (context, index) {
              final product = s.products[index];
              return ListTile(
                title: Text(product.name),
              );
            },
          ),
        );
      },
    );
  }
}
