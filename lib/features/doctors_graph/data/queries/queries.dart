class MyQueries {
  static String filterDoctor() => '''
    query {
      products(Function: "Filters"){
        name_ar
        name_en
        admin_comment
        attributes{
          id
        }
        category{
          name_ar
          id 
        }           
      }
    }
  ''';
}
