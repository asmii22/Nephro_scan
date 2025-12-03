import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

class TitleViewAllWidget extends StatefulWidget {
  const TitleViewAllWidget({
    super.key,
    required this.title,
    this.onViewAllTap,
    this.keywords,
    this.onKeywordSelected,
    this.selectedKeyword,
    this.horizontalPadding,
  });

  final String title;
  final VoidCallback? onViewAllTap;
  final List<String>? keywords;
  final ValueChanged<String>? onKeywordSelected;
  final double? horizontalPadding;
  final String? selectedKeyword;

  @override
  State<TitleViewAllWidget> createState() => _TitleViewAllWidgetState();
}

class _TitleViewAllWidgetState extends State<TitleViewAllWidget> {
  String? _selectedKeyword;
  List<String> _keywords = [];

  @override
  void initState() {
    super.initState();
    _initializeKeywords();
    _selectedKeyword = widget.selectedKeyword ?? 'All';
  }

  @override
  void didUpdateWidget(TitleViewAllWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.keywords != oldWidget.keywords) {
      _initializeKeywords();
    }
    if (widget.selectedKeyword != oldWidget.selectedKeyword) {
      _selectedKeyword = widget.selectedKeyword;
    }
  }

  void _initializeKeywords() {
    if (widget.keywords != null && widget.keywords!.isNotEmpty) {
      // Add 'All' at the beginning if not already present
      if (!widget.keywords!.contains('All')) {
        _keywords = ['All', ...widget.keywords!];
      } else {
        _keywords = widget.keywords!;
      }
    } else {
      _keywords = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding ?? 0.0,
          ),
          child: Row(
            children: [
              Text(widget.title, style: AppTextStyles.bodyLargePoppins),
              const Spacer(),
              if (widget.onViewAllTap != null)
                InkWell(
                  onTap: widget.onViewAllTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      'View All',
                      style: AppTextStyles.bodySmallMontserrat.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (widget.keywords != null && widget.keywords!.isNotEmpty) ...[
          12.verticalBox,
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _keywords.length,
              separatorBuilder: (context, index) => 2.horizontalBox,
              itemBuilder: (context, index) {
                final keyword = _keywords[index];
                final isSelected = _selectedKeyword == keyword;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedKeyword = keyword;
                    });
                    widget.onKeywordSelected?.call(keyword);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(
                              context,
                            ).colorScheme.onPrimary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(
                                context,
                              ).colorScheme.onPrimary.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        keyword,
                        style: AppTextStyles.bodySmallPoppins.copyWith(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
