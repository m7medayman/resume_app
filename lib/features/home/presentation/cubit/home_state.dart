part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.pageState,
    required this.pdfWidgetData,
  });

  final PageState pageState;
  final List<PdfWidgetViewData> pdfWidgetData;

  HomeState copyWith({
    PageState? pageState,
    List<PdfWidgetViewData>? pdfWidgetData,
  }) {
    return HomeState(
      pageState: pageState ?? this.pageState,
      pdfWidgetData: pdfWidgetData ?? this.pdfWidgetData,
    );
  }

  @override
  List<Object> get props => [pageState, pdfWidgetData];
}