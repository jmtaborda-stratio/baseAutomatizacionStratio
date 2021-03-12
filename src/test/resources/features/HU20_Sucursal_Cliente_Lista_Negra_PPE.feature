Feature: HU20 Usuario que inicia en sucursal pertenece a la lista negra o es PPE
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
    Given Un cliente con la "<marca>"
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

  Scenario: Mensaje Adjuntar documentos
    Given Un cliente con la marca PPE se encuentra en el cuestionario de alto riesgo
    When Se pulsa en el boton CONTINUAR
    And Se pulsa sobre el nombre del cliente
    Then Se muestra la leyenda "Adjuntar documentos"
    And Existe una apartado de comentarios para informar al área de UPLD
    And Se permite subir documentos

  Scenario: Boton Enviar a UPLD
    Given Un cliente con la marca PPE completa el cuestionario de alto riesgo
    When Se pulsa sobre  el botón donde "Enviar a UPLD"
    Then Se genera un correo al área de UPLD con la información del cuestionario y los documentos adjuntos

# 9. En caso de que se considere un Ex-PPE , es decir que haya dejado el cargo hace más de un año ya no se considera un persona de alto riesgo, por lo que se deberá solicitar al área de UPLD la corrección en los campos de PPE y Riesgo.
# 9.1 No es obligatorio el cuestionario, solo en los comentarios solicitar al área de UPLD el cambio de estatus en PPE y Riesgo.
# 10. Si efectivamente se trata de una persona en Lista Negra, se considera de alto riesgo y es necesario recabar la identificación, RFC o fecha de nacimiento, VoBo DR y visita domiciliaria
# 11. Con los requisitos antes indicados en el criterio 10, se canaliza a UPLD

  Scenario: Boton Aceptar mensaje de cliente Lista negra
    Given Un cliente con la marca Lista negra
    When El sistema valida que cliente cuenta con alguna marca y muestra el mensaje
    And Se pulsa el boton ACEPTAR
    Then No se redirige al cuestionario de alto riesgo "KYC PPE", identificación, visita domiciliaria y VoBo del DR
    And Se muestra la leyenda "No es posible con continuar con la apertura por inconsistencias en la información"


  Scenario: Cliente homónimo PPE
    Given Un cliente con la marca homónimo PPE
    When El sistema valida que cliente cuenta con alguna marca y muestra el mensaje
    And Se pulsa el boton ACEPTAR
    Then Se detona nuevamente el correo desde la plataforma a UPLD, mandando el número de cliente, copia de identificación, descripción de la actividad y/o giro a la cual se dedica información sobre el cliente o algún familiar cercano que ocupa o ha ocupado algún cargo público

  Scenario: Botones Continuar y regresar
    When Un cliente con la marca se encuentra en el cuestionario de alto riesgo
    Then Existen dos botones: en la parte inferior izquierda “Regresar”, en la derecha “Continuar” donde te debe permitir avanzar y guardar