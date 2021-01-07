import 'package:flutter/material.dart';
import 'package:flutter_calculadora_imc/components/form_field_builder.dart';
import 'package:flutter_calculadora_imc/components/imc_rating.dart';
import 'package:flutter_calculadora_imc/components/result_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _wheightController = TextEditingController();
  String _info = " ";
  String _valueImc = " ";

  void calculateImc() {
    double _height = double.parse(_heightController.text);
    double _weight = double.parse(_wheightController.text);
    double imc = _weight / (_height * _height);

    setState(() {
      _info = imcRating(imc);
      _valueImc = 'IMC = ${imc.toStringAsPrecision(3)}';
    });
  }

  void _resetFormFields() {
    _wheightController.text = "";
    _heightController.text = "";

    setState(() {
      _info = " ";
      _valueImc = " ";
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cálculo de IMC',
          style: TextStyle(color: Colors.white60, fontSize: 24.0),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white60,
              size: 34.0,
            ),
            onPressed: () {
              _resetFormFields();
            },
          ),
        ],
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 150.0,
                color: Colors.blue,
              ),
              FormInputBuilder(
                controller: _heightController,
                errorMessage: "Preencha o campo altura",
                labelText: "Altura",
                hintText: "1.70",
              ),
              FormInputBuilder(
                controller: _wheightController,
                errorMessage: "Preencha o campo Peso",
                labelText: "Peso",
                hintText: "75",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  padding: EdgeInsets.only(
                      left: 50.0, top: 10.0, right: 50.0, bottom: 10.0),
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      calculateImc();
                    }
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 24.0, color: Colors.white60),
                  ),
                ),
              ),
              ResultText(valueImc: _valueImc, info: _info)
            ],
          ),
        ),
      ),
    );
  }
}
