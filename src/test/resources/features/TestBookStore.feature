@BookStore @Regresion
Feature: Test del software de la tienda de libros
  Dado un usuario que accede a la página de la Book Store
  Cuando realiza búsqueda de libros
  Entonces la página le devuelve los libros que ha buscado

  @LoginSatisfactorio @SmokyTest
  Scenario Outline: Registro de usuario satisfactorio en la Book Store
    Given La Book Store esta funcionando correctamente
    When Realizo un registro de usuario con los datos "<Nombre>","<Apellidos>","<Usuario>","<Contraseña>"
    Then El "<Usuario>" se da de alta correctamente
    Examples:
      | Nombre                              | Apellidos | Usuario  | Contraseña |
      | tes12t                                | test      | 11 12      | 12345Aa@   |
      | Test 12                               | Test1     | 22   12    | 12345Aa@   |
      | test1  12                             | Test3     | 33     12  | 12345Aa@   |
      | Test23   12                           | Apelñlido | 44       12| 12345Aa@   |
      | Test12@    12                         | adsasdas  | 55       12| 1212345Aa@   |
      | NombreMuuuuuu12uuuuuuuuuuuuuuuuyLargo | Apellidos | 66       12| 12345Aa@   |


  Scenario Outline: Registro incorrecto de usuarios duplicado en la Book Store
    Given La Book Store esta funcionando correctamente
    When Realizo un registro de usuario con los datos "<Nombre>","<Apellidos>","<Usuario>","<Contraseña>"
    Then El "<Usuario>" no se da de alta correctamente
    Examples:
      | Nombre                              | Apellidos | Usuario  | Contraseña |
      | test                                | test      | 11       | 12345Aa@   |
      | Test                                | Test1     | 22       | 12345Aa@   |
      | test1                               | Test3     | 33       | 12345Aa@   |
      | Test23                              | Apelñlido | 44       | 12345Aa@   |
      | Test12@                             | adsasdas  | 55       | 12345Aa@   |
      | NombreMuuuuuuuuuuuuuuuuuuuuuuyLargo | Apellidos | 66       | 12345Aa@   |