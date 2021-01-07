String imcRating(double imc){
  String info;
  if (imc < 18.5) {
    info = 'Magreza';
  } else if (imc >= 18.5 && imc < 25.0) {
    info = 'Normal';
  } else if (imc >= 25.0 && imc < 30.0) {
    info = 'Sobrepeso';
  } else if (imc >= 30.0 && imc < 40.0) {
    info = 'Obesidade';
  } else if (imc >= 40.0) {
    info = 'Obesidade Grave';
  }
  return info;
}