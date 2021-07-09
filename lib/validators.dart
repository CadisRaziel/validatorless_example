
//Criando um validatorless personalizado !!


import 'package:flutter/cupertino.dart';

class ValidatorsSenhas {
  //constructor privado para ser acessado apenas por valores statics
  ValidatorsSenhas._();

  //FormFieldValidator = é um typedef
  //o controller abaixo é para comparar as senhas se as duas estão iguais
  static FormFieldValidator compare (TextEditingController? valueEC, String message) {
    //esse value é o valor digitado la no campo do FormTextField
    return (value) {
      final valueCompare = valueEC?.text ?? '';
      if(value == null || (value != null && value != valueCompare)) {
        return message;
      }
      return null;
    };
  }

}