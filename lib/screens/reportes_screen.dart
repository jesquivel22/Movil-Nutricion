import 'dart:convert';

import 'package:aplicacion_movil/conexion.dart';
import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:aplicacion_movil/widgets/custom_grafico.dart';
import 'package:aplicacion_movil/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({Key? key}) : super(key: key);

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  int _paginaActual = 0;
  Map<String, dynamic>? data;
  List postsData = [];
  Map<String, dynamic>? data2;
  List postsData2 = [];

  _getData(id) async {
    final url = Uri.parse(local + 'api/perfil/MEstudiante/${id}');

    final response = await http.get(url);
    print(response);
    this.data = json.decode(response.body);
    setState(() {
      this.postsData = this.data!['result'];
      Preferences.h_comunitarias = postsData[0]['h_comunitarias'];
      Preferences.h_clinicas = postsData[0]['h_clinicas'];
      print("EN SETSTATE");
      print(postsData);
    });
    print("RESPONSE BODY");
    print(response.body);
  }

  _getData2(id) async {
    final url = Uri.parse(local + 'api/perfil/MHistorial/${id}');

    final response = await http.get(url);
    print(response);
    this.data2 = json.decode(response.body);
    setState(() {
      this.postsData2 = this.data2!['result'];
      print("EN SETSTATE");
      print(postsData2);
      print(postsData2.length);
    });
    print("RESPONSE BODY");
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getData(Preferences.idpersona);
    _getData2(Preferences.idpersona);
    _ini();
  }

  _ini() async {
    final userInfo = await Provider.of<UsuarioProvider>(context, listen: false);
    userInfo.h_comunitarias = Preferences.h_comunitarias;
    userInfo.h_clinicas = Preferences.h_clinicas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primary,
          title: const Text("Reportes"),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _paginaActual = index;
              });
            },
            currentIndex: _paginaActual,
            selectedItemColor: AppTheme.primary,
            selectedFontSize: 15,
            unselectedFontSize: 13,
            iconSize: 30,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_sharp),
                label: 'Graficos',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: <Widget>[
                    Icon(Icons.list_alt_outlined),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      // child: Icon(
                      //   Icons.brightness_1,
                      //   size: 8,
                      //   color: AppTheme.primary,
                      // ),
                      child: Container(
                        child: Text(
                          "6",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: AppTheme.primary, //blue
                            shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
                label: 'historial',
              ),
            ]),
        body: _paginaActual == 0
            ? _graficos()
            : Historial(
                registros: postsData2,
              )
        // graficos(context),
        );
  }
}

class _graficos extends StatefulWidget {
  const _graficos({super.key});

  @override
  State<_graficos> createState() => __graficosState();
}

class __graficosState extends State<_graficos> {
  late List<GDPData> _chartData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _chartData = getChartData();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SfCircularChart(
          title: ChartTitle(
              borderWidth: 50,
              text: "Grafico Circular de tus Horas Realizadas",
              textStyle: Theme.of(context).textTheme.headline4),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            PieSeries<GDPData, String>(
                dataSource: _chartData,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ],
        ),
      ),
    ));
  }

  List<GDPData> getChartData() {
    final userInfo = Provider.of<UsuarioProvider>(context);

    int h_faltantes = (500 - userInfo.h_comunitarias + userInfo.h_clinicas);
    final List<GDPData> chartData = [
      GDPData("H. Comunitarias", userInfo.h_comunitarias),
      GDPData("H. Clinicas", userInfo.h_clinicas),
      GDPData("H. Faltantes", h_faltantes),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

class Historial extends StatelessWidget {
  final List registros;
  const Historial({super.key, required this.registros});

  @override
  Widget build(BuildContext context) {
    String format(String date) {
      var result = date.substring(0, 10);
      print(result);
      return result;
    }

    ;
    var mediaquery = MediaQuery.of(context);
    Size size = mediaquery.size;
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: registros.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 6,
            child: ListTile(
                leading: CircleAvatar(
                  radius: 38,
                  backgroundImage: AssetImage("assets/company.png"),
                ),
                title: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.10,
                    ),
                    Container(
                      width: 200,
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          registros[index]['nombre'],
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${format(registros[index]['f_inicio'])}  hasta  ${format(registros[index]['f_fin'])}",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: size.width * 0.12,
                    ),
                    Container(
                      child: Icon(
                        Icons.more_time,
                        size: 50,
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
