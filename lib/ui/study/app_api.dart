

Future<String> getProfileUserName(String company) async{
   await Future.delayed(const Duration(seconds: 5));
   return "$company- ityu";
}


Future<String> getCountry() async{
  await Future.delayed(const Duration(seconds: 5));
  return "Beijing";
}


Stream<String> getSessionTime(String units) {
  return Stream.periodic(const Duration(seconds: 1),(data)=>"${data++} $units");
}