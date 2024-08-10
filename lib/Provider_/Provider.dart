import 'package:flutter/material.dart';
import 'package:coba/Repository.dart';
import '../Model.dart';


class DataProvider extends ChangeNotifier {
  List<Daftar> daftar = [];
  Repository repository = Repository();
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  final int perPage = 12;

  DataProvider() {
    getData();

    // Tambahkan listener untuk ScrollController
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Load halaman berikutnya ketika mencapai bagian bawah
        loadNextPage();
      }
    });
  }

  Future<void> getData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      daftar.clear();
    }

    isLoading = true;
    notifyListeners();

    try {
      List<Daftar> newData =
      await repository.getData(page: currentPage, perPage: perPage);
      daftar.addAll(newData);
      currentPage++;
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadNextPage() async {
    if (!isLoading) {
      await getData();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
