import 'package:flutter/material.dart';

class ImcCalculate extends StatefulWidget {
  final void Function(String)? onImcCalculated;

  const ImcCalculate({
    super.key,
    this.onImcCalculated,
  });

  @override
  State<ImcCalculate> createState() => _ImcCalculateState();
}

class _ImcCalculateState extends State<ImcCalculate> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe seus dados!';

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados!';
      _formKey = GlobalKey<FormState>();
      widget.onImcCalculated?.call(''); // Clear the IMC category suggestion
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText =
            'Seu IMC é ${imc.toStringAsPrecision(3)} você esta abaixo do peso ';
        widget.onImcCalculated?.call('Abaixo do peso');
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText =
            'Seu IMC é ${imc.toStringAsPrecision(3)} você esta no peso ideal';
        widget.onImcCalculated?.call('Peso ideal');
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            'Seu IMC é ${imc.toStringAsPrecision(3)} você esta Levemente acima do peso';
        widget.onImcCalculated?.call('Levemente acima do peso');
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText =
            'Seu IMC é ${imc.toStringAsPrecision(3)} você esta com Obesidade Grau I ';
        widget.onImcCalculated?.call('Obesidade Grau I');
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText =
            'Seu IMC é ${imc.toStringAsPrecision(3)} você esta com Obesidade Grau II ';
        widget.onImcCalculated?.call('Obesidade Grau II');
      } else if (imc >= 40) {
        _infoText =
            'Seu IMC é ${imc.toStringAsPrecision(3)} você esta com Obesidade Grau III';
        widget.onImcCalculated?.call('Obesidade Grau III');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.refresh, color: Theme.of(context).primaryColor),
              onPressed: _resetFields,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.balance, size: 120.0, color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Peso (kg)',
                                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor, fontSize: 20.0),
                                controller: weightController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Insira seu peso!';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Altura (cm)',
                                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor, fontSize: 20.0),
                                controller: heightController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Insira sua altura!';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: SizedBox(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          ),
                          child: const Text(
                            'Calcular',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
