import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 350.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearBox(),
            _crearSwitch(),
            _crearImagen()
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 200,
      max: 400,
      onChanged: _bloquearCheck ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );

  }

  Widget _crearBox(){

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

  Widget _crearSwitch(){
    
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

  Widget _crearImagen(){

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.elasticInOut,
        child: FadeInImage(
          image: NetworkImage('https://aws.revistavanityfair.es/prod/designs/v1/assets/2444x2020/170456.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          width: _valorSlider,
          height: 400,
          fit: BoxFit.contain,
        ),
      ),
    );

  }
}