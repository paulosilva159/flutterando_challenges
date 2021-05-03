import 'package:flutter/material.dart';
import 'package:flutterando_class/app/data/model/book.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/flutterando_category_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/category_tile_list_view.dart';

import '../../../../core/constants/colors.dart';

class FlutterandoBookListView extends StatelessWidget {
  const FlutterandoBookListView({required this.bookList});

  final List<Book> bookList;

  @override
  Widget build(BuildContext context) {
    return CategoryTileListView(
      itemListLength: bookList.length,
      itemBuilder: (context, index) => _FlutterandoBook(
        book: bookList[index],
      ),
      title: FlutterandoCategoryListViewTitle(
        categoryIconPathUrl: 'assets/img/icons/stop.png',
        categoryLabel: 'books',
      ),
      maxHeight: 250,
    );
  }
}

class _FlutterandoBook extends StatelessWidget {
  const _FlutterandoBook({
    required this.book,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 210,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    book.coverPathUrl,
                    height: 160,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      '\"${book.title}\"',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              book.author,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.subtitle,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
