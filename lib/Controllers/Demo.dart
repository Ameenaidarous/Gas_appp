
  List<T> convertJson<T>(T fun(Map<String,dynamic> map),List listData){
    List<T> list1 = listData.map((e) => fun(e)).toList();
    return list1;
  }
  

