import 'package:flutter/material.dart';
import 'package:flutterando_class/app/data/model/knowledge_trail.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/category_tile_list_view.dart';
import 'package:flutterando_class/app/modules/common/see_all_button.dart';

import '../../../../core/constants/colors.dart';

class KnowledgeTrailListView extends StatelessWidget {
  const KnowledgeTrailListView({required this.knowledgeTrailList});

  final List<KnowledgeTrail> knowledgeTrailList;

  @override
  Widget build(BuildContext context) {
    return CategoryTileListView(
      itemBuilder: (context, index) =>
          _KnowledgeTrailTile(knowledgeTrail: knowledgeTrailList[index]),
      itemListLength: knowledgeTrailList.length,
      title: Text(
        'Trilha de conhecimento',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.subtitle,
        ),
      ),
    );
  }
}

class _KnowledgeTrailTile extends StatelessWidget {
  const _KnowledgeTrailTile({required this.knowledgeTrail});

  final KnowledgeTrail knowledgeTrail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/img/icons/trails.png',
                    height: 12,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    knowledgeTrail.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title,
                    ),
                  )
                ],
              ),
              RedirectionLabeledButton(
                label: 'assistir',
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                knowledgeTrail.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.subtitle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
