import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:validatorless_example/validators.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //globalKey para validar os fomularios
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validatorless'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _nameEC,
                  decoration: InputDecoration(labelText: 'Nome'),

                  ///[adicionando as validações]
                  validator: Validatorless.required('Nome obrigatório')),
              TextFormField(
                controller: _emailEC,
                decoration: InputDecoration(labelText: 'Email'),

                ///[Para fazer varias validações]
                ///[o required é para campos que ficam nullos ou seja, vazios]
                validator: Validatorless.multiple([
                  Validatorless.required('Email obrigatório'),
                  Validatorless.email('Email inválido')
                ]),
              ),
              TextFormField(
                controller: _passwordEC,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: Validatorless.multiple([
                  Validatorless.required('Senha obrigatória'),

                  ///[Olha que legal aqui eu coloco o numero minimo de caracteres]
                  ///[ou seja coloco 6 que é o minimo que tem que ter e a frase !!]
                  Validatorless.min(
                      6, 'A senha precisa ter no minimo 6 caracteres')
                ]),
              ),
              TextFormField(
                controller: _confirmPasswordEC,
                decoration: InputDecoration(labelText: 'Confirmar a senha'),
                validator: Validatorless.multiple([
                  Validatorless.required('Confirmar senha obrigatória'),

                  ///[Olha que legal aqui eu coloco o numero minimo de caracteres]
                  ///[ou seja coloco 6 que é o minimo que tem que ter e a frase !!]
                  Validatorless.min(
                      6, 'A senha para confirmar precisa ter no minimo 6 caracteres'),
                  ValidatorsSenhas.compare(_passwordEC, 'A senha não esta igual')
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    //chamaria a controller para salvar os dados !!
                  }
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Como seria a validação convencional

/* 
  validator: (String? value) {
    if(value == null || value.isEmpty){
      return 'Nome Obrigatório';
     }
 */
