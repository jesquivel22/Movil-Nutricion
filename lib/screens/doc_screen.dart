import 'dart:io';
import 'package:aplicacion_movil/conexion.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DocScreen extends StatefulWidget {
  DocScreen({Key? key}) : super(key: key);

  @override
  State<DocScreen> createState() => _DocScreenState();
}

class _DocScreenState extends State<DocScreen> {
  Map<String, dynamic>? data;
  List postsData = [];
  List postsData2 = [];

  /////////// TRAYENDO TODA LA DATA GENERAL

  _getData() async {
    final url = Uri.parse(local + 'api/documento/M');

    final response = await http.get(url);
    print(response);
    this.data = json.decode(response.body);
    setState(() {
      this.postsData = this.data!['result'];
      print("EN SETSTATE");
      print(postsData);
      print(postsData.length);
      print(postsData[1]['nombre']);
      print(data!['id']);
    });
    print("RESPONSE BODY");
    print(response.body);
  }

  _getData2(id) async {
    final url = Uri.parse(local + 'api/documento/MSE/${id}');

    final response = await http.get(url);
    print(response);
    this.data = json.decode(response.body);
    setState(() {
      this.postsData2 = this.data!['result'];
      print("EN SETSTATE");
      print(postsData);
      print(postsData.length);
      print(postsData[1]['nombre']);
      print(data!['id']);
    });
    print("RESPONSE BODY");
    print(response.body);
  }

//cambioooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
  late Future<ListResult> futureFiles;
  @override
  void initState() {
    super.initState();
    _getData();
    _getData2(Preferences.idpersona);
  }

  int _paginaActual = 0;
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: 'Documentos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.upload_file),
                label: 'Importar',
              ),
            ]),
        body: _paginaActual == 0
            ? DocDescargar(
                documentos: postsData,
              )
            : DocEstudiante(
                documentos: postsData2,
              ));
  }

  Future downloadFile(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('downloaded ${ref.name}')));
  }
}

class DocEstudiante extends StatelessWidget {
  final List documentos;
  const DocEstudiante({Key? key, required this.documentos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: documentos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.description_rounded,
                color: AppTheme.primary,
              ),
              title: Text(documentos[index]['nombre']),
              trailing: IconButton(
                  onPressed: () => openFile(
                      url: documentos[index]['url'],
                      fileName: (documentos[index]['nombre']) + ".pdf"),
                  icon: Icon(Icons.download)),
            ),
          );
        },
      ),
    );
  }
}

class DocDescargar extends StatelessWidget {
  final List documentos;
  const DocDescargar({Key? key, required this.documentos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: documentos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.description_rounded,
                color: AppTheme.primary,
              ),
              title: Text(documentos[index]['nombre']),
              trailing: IconButton(
                  onPressed: () => openFile(
                      url: documentos[index]['url'],
                      fileName: (documentos[index]['nombre']) + ".pdf"),
                  icon: Icon(Icons.download)),
            ),
          );
        },
      ),
    );
  }
}

Future openFile({required String url, String? fileName}) async {
  final file = await downloadFile(url, fileName!);
  if (file == null) return;

  print('Path: ${file.path}');

  OpenFile.open(file.path);
}

Future<File?> downloadFile(String url, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File("${appStorage.path}/$name");

  try {
    final response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  } catch (e) {
    return null;
  }
}
