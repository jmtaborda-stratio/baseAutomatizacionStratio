Feature: Usuario que inicia en sucursal pertenece a la lista negra o es PPE
  COMO área de UPLD
  QUIERO identificar si el prospecto es un prospecto esta en lista negra y/o es PPE
  PARA validar si ha desempeñado o está desempeñándose en alguna función pública

  Background:
    Given El cliente se presenta en sucursal y el ejecutivo localiza su información

  Scenario Outline: Validación marcas de cliente
    Given El sistema valida si el cliente cuenta con alguna marca
    When El cliente cuenta con la "<marca>"
    Then El sistema les debe de arrojar un "<mensaje>"
    And Debe existir un botón con la leyenda de “Aceptar” para los mensajes

    Examples:
      | marca       | mensaje                           |
      | PPE         | Este cliente está en la lista PPE |
      | homonimo    | Cliente es un Homónimo de PPE     |
      | lista_negra | Este cliente está en Lista Negra  |


  Scenario Outline: Boton Aceptar mensaje de cliente con marcas
    Given Un cliente con la "<marca>
    When El sistema valida que cliente cuenta con alguna marca y muestra el mensaje
    And Se pulsa el boton ACEPTAR
    Then el cliente se registra en sistema como “PPE: Si” y “Riesgo: Alto”

    Examples:
      | marca       |
      | PPE         |
      | lista_negra |

  Scenario: Boton Aceptar mensaje de cliente PPE
    Given Un cliente con la marca PPE
    When El sistema valida que cliente cuenta con alguna marca y muestra el mensaje
    And Se pulsa el boton ACEPTAR
    Then Se redirige al cuestionario de alto riesgo "KYC PPE", identificación, visita domiciliaria y VoBo del DR

  Scenario: Cuestionario de alto riesgo "KYC PPE"
    Given Un cliente con la marca PPE está en el cuestionario de alto riesgo
    When Se pulsa en el boton CONTINUAR
    Then el sistema valida que el cuestionario este completo de no ser así no debe permitir continuar

  Scenario: Cuestionario de alto riesgo "KYC PPE" completado
    Given Un cliente con la marca PPE completa el cuestionario de alto riesgo
    When Se pulsa en el boton CONTINUAR
    Then el sistema guarda la información registrada






