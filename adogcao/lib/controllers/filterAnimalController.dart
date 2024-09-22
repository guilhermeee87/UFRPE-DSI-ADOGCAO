import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/animal.dart';

class FilterAnimalController{

  Future<List<Animal>> getFilteredAnimals(String nome, String tipo, String abrigo) async{
  Query query = FirebaseFirestore.instance.collection('pets');

  if (nome.isNotEmpty) {
    query = query.where('name', isEqualTo: nome);
  }
  if (tipo.isNotEmpty) {
    query = query.where('animalType', isEqualTo: tipo);
  }
  if (abrigo.isNotEmpty) {
    query = query.where('shelterId', isEqualTo: abrigo);
  }

  QuerySnapshot querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => Animal.fromDocument(doc)).toList();
  }

}


