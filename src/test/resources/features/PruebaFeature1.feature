Feature: Esto es una feature de prueba para la formacion

  Esto es una descripcion de prueba

  Scenario: Prueba de validacion del API jsonPlaceHolder
    Given El API "https://jsonplaceholder.typicode.com" esta en funcionamiento y el statusCode es "200"
    When Realizo una peticion "GET" sobre el API "https://jsonplaceholder.typicode.com/posts"
    Then La respuesta coincide con la "outputJsonPlaceHolderPost.json" esperada