import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PostAPIService{

  Future saveCycleLength() async {
    var length = await PreferencesManager.getCycleLength();
    print(length);

    final response = await http.post(
        Uri.parse('$apiUrl/api/save-cycle-length?id=23&token=0DNQu1MISfxorcfpECunNqPgyZRhpzIRlcwuic47te9XfrNjZxKRCgng0cq7fqie&average_cycle_length=$length'),
        headers: {"Content-Type": "application/json"}
        );

        print(response.body);
  }

  Future savePeriodDay() async{
    DateTime? periodDate = await PreferencesManager.getLastPeriodDate();
    print(periodDate);

    final response = await http.post(
        Uri.parse('$apiUrl/api/save-period-day?id=23&token=0DNQu1MISfxorcfpECunNqPgyZRhpzIRlcwuic47te9XfrNjZxKRCgng0cq7fqie&period_day=$periodDate'),
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future savePeriodDuration() async{
    var durationLength = await PreferencesManager.getPeriodDuration();
    print(durationLength);

    final response = await http.post(
        Uri.parse('$apiUrl/api/save-cycle-days?id=23&token=0DNQu1MISfxorcfpECunNqPgyZRhpzIRlcwuic47te9XfrNjZxKRCgng0cq7fqie&average_cycle_days=$durationLength'),
        // qParams: queryParameters,
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future saveSignUpQuestions() async{
    var signUpVariables = await PreferencesManager.getSignUpVariables();
    // print(signUpVariables?['name']);
    // print(signUpVariables?['dob']);
    // print(signUpVariables?['maritalStatus']);
    // print(signUpVariables);


    final response = await http.post(Uri.parse(
        '$apiUrl/api/save-deatils?'
        'id=23'
        '&token=0DNQu1MISfxorcfpECunNqPgyZRhpzIRlcwuic47te9XfrNjZxKRCgng0cq7fqie'
        '&name=${signUpVariables?['name']}'
        '&dob=${signUpVariables?['dob']}'
        '&age=${signUpVariables?['age']}'
        '&marital_status=${signUpVariables?['maritalStatus']}'
        '&height=${signUpVariables?['height']}'
        '&weight=${signUpVariables?['weight']}'
        '&country_id=2'
    ),
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future saveTrackSymptoms() async{
    // Getting all values:
    final data = await PreferencesManager.getSymptoms();

    String liveliness = data['liveliness'].map((number) => number.toString()).join(',');
    String feelings = data['feelings'].map((number) => number.toString()).join(',');
    String formattedDate = DateFormat('yyyy-MM-dd').format(data['date']);

    final response = await http.post(Uri.parse(
        '$apiUrl/api/save-symptoms?'
            'id=23'
            '&token=0DNQu1MISfxorcfpECunNqPgyZRhpzIRlcwuic47te9XfrNjZxKRCgng0cq7fqie'
            '&menstrual_flow=${data['flow']}'
            '&symptoms[]=$liveliness'
            '&energy=${data['energy']}'
            '&emotions[]=$feelings'
            '&date=$formattedDate'
    ),
        headers: {"Content-Type": "application/json"}
    );

    print(response.body);

    print((data['date']).runtimeType);
    // print(data['flow']);
    // print(data['feelings']);
    // print(data['energy']);
    // print(data['liveliness']);



  }

}