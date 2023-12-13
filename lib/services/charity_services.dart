import 'package:digichar/services/services.dart';
import 'package:flutter/material.dart';
import '../api/server_api.dart';
import '../models/charities/charityResponse.dart';
import '../models/models.dart';

class CharityService extends ChangeNotifier {
  List<Charity> charities = [];
  List<Charity> charitiesResult = [];
  String query = '';

  Future<void> getCharities() async {
    List<Charity> list = [];

    try {
      final json = await ServerApi.httpGet('/interview');

      for (var obj in json) {
        final charity = Charity.fromJson(obj);
        list.add(charity);
      }
      charities = list;
      notifyListeners();
    } catch (e) {
      // final error = MessageResponse.fromJson(e as Map<String, dynamic>);
      // return error.msg;
      NotificationsServices.showSnapbarError('Not Found Query');
    }
  }

  Future<void> getSearch() async {
    List<Charity> list = [];

    try {
      final json = await ServerApi.httpGet('/interview?nom_interviewer=$query');

      for (var obj in json) {
        final charity = Charity.fromJson(obj);
        list.add(charity);
      }
      charitiesResult = list;
      notifyListeners();
    } catch (e) {
      // final error = MessageResponse.fromJson(e as Map<String, dynamic>);
      // return error.msg;
      NotificationsServices.showSnapbarError('Not Found Query');
    }
  }

  Future<Charity?> submitCharity(Charity charity) async {
    if (charity.id == null) {
      return await createCharity(charity);
    } else {
      return await updateCharity(charity);
    }
  }

  Future<Charity?> createCharity(Charity charity) async {
    try {
      final json = await ServerApi.httpPost('/interview/add', charity.toJson());
      final charityResp = CharityResponse.fromJson(json);
      charities.add(charityResp.data);
      notifyListeners();
      return charityResp.data;
    } catch (e) {
      return null;
    }
  }

  Future<Charity?> updateCharity(Charity charity) async {
    try {
      final json =
          await ServerApi.httpPut('/interview/update', charity.toJson());
      final charityResp = CharityResponse.fromJson(json);

      charities = charities.map((e) {
        if (e.id != charityResp.data.id) return e;
        return charityResp.data;
      }).toList();
      notifyListeners();
      return charityResp.data;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteCharity(Charity charity) async {
    try {
      await ServerApi.httpDelete('/interview/delete', charity.toJson());
      charities.removeWhere((element) => element.id == charity.id);
       notifyListeners();
    } catch (e) {
      NotificationsServices.showSnapbarError('Not Found Query');
    }
  }
}
