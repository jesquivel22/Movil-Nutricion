import 'package:aplicacion_movil/screens/screens.dart';
import 'package:fl_chart/fl_chart.dart';

Container buildChart(
    BuildContext context,
    final String _1_name,
    final int _1_horas,
    final Color _1_color,
    final String _2_name,
    final int _2_horas,
    final Color _2_color,
    final String title) {
  var mediaquery = MediaQuery.of(context);
  Size size = mediaquery.size;
  List<PieChartSectionData> sectionsChart = [
    PieChartSectionData(
      value: _1_horas.toDouble(),
      title: _1_horas.toString(),
      showTitle: true,
      color: _1_color,
      radius: size.width * 0.30,
    ),
    PieChartSectionData(
      value: _2_horas.toDouble(),
      title: _2_horas.toString(),
      showTitle: true,
      color: _2_color,
      radius: size.width * 0.30,
    ),
  ];
  return Container(
    padding: EdgeInsets.all(size.width * 0.04),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.all(size.width * 0.04),
          height: size.width * 0.60,
          child: PieChart(
            PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: sectionsChart),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                color: _1_color,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(_1_name),
              const SizedBox(
                width: 40,
              ),
              Container(
                height: 10,
                width: 10,
                color: _2_color,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(_2_name)
            ],
          ),
        )
      ],
    ),
  );
}
