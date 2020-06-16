import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

		//Retonar en un futuro porque al cargar la data del json
		//Puede demorar unos milisegundos más tarde de la carga de esta clase
		return FutureBuilder(
			future: menuProvider.cargarData(),
			initialData: [],
			builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

				return ListView(
					children: _listaItems(snapshot.data, context),
				);

			},
		);
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

		final List<Widget> opciones = [];
		data.forEach((opt) {
			final widgetTemp = ListTile(
				title: Text(opt['texto']),
				leading: getIcon(opt['icon']),
				trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
				onTap: () {

					Navigator.pushNamed(context, opt['ruta']);

					/*final route = MaterialPageRoute(
						builder: (context) => AlertPage() 
					);
					
					Navigator.push(context, route);*/

				},
			);

			opciones..add(widgetTemp)..add(Divider());
		});

		return opciones;
  }
}