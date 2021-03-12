Feature: HU25 Upgrade N4 FULL
  Como cliente
  QUIERO contar con una cuenta que me permita recibir depósitos mensuales superiores a $180K

  Background:
    Given El ejecutivo realiza el proceso éxitoso de enrolamiento de un cliente

  Scenario: Botón de UPGRADE CUENTA CONECTA SIN LÍMITE
    Given El ejecutivo se encuetra en el pop-up de elección
    When Se pulsa el boton UPGRADE CUENTA CONECTA SIN LÍMITE
    Then Se despliega una pantalla con el mensaje "Estás habilitando una Cuenta Conecta N4 sin tope en el límite de depósitos mensuales. Por favor contesta el siguiente cuestionario"
    And Se despliega el KYC completo para que el ejecutivo pueda recabar la información complementaria

  Scenario: Guardado de información
    Given El ejecutivo se encuetra en el cuestionario KYC
    When Se pulsa el boton ACEPTAR
    Then Se guarda información en el sistema
    And La pantalla muestra el botón ASIGNAR CUENTA CONECTA


  Scenario: Botón ASIGNAR CUENTA CONECTA
    Given Se completa el cuestionario KYC
    And Se pulsa el botón ASIGNAR CUENTA CONECTA
    And Se pide confirmación al ejecutivo para que la cuenta quede ASIGNADA con la siguiente leyenda "Estás por Asignar la cuenta Conecta sin límite de depósitos mensuales al cliente, por favor confirma que la información es correcta antes de aceptar"
    When Se confirma la asignación de Cuenta
    Then se cambia el ID PROSPECTO por ID CLIENTE ÚNICO
    And Se despliega una pantalla donde se indique los datos siguientes:
      | Nombre Completo del Cliente                                                 |
      | ID UNICO de CLIENTE                                                         |
      | Nombre del producto: CUENTA CONECTA                                         |
      | Características básicas del producto: N4 sin límites de depósitos mensuales |
      | Número de Cuenta: XXXXXXX                                                   |
      | Número de Cuenta Clabe: (18 posiciones)                                     |
      | Estatus de la Cuenta: ACTIVO                                                |
    And Existe el botón de ACEPTAR en tono diferente y distinguirse del texto

  Scenario: Botón ASIGNACIÓN TARJETA DÉBITO
    Given El ejecutivo se encuentra en la pantalla de resumen de datos
    When Se pulsa el botón ACEPTAR
    And Aparece un pop-up con las siguientes opciones:
      | ASIGNACIÓN TARJETA DÉBITO      |
      | GENERACIÓN CHEQUERA (opcional) |
    And Se pulsa sobre el botón ASIGNACIÓN TARJETA DÉBITO
    Then Se redirige al flujo de ASIGNACIÓN TARJETA DÉBITO

  Scenario: Botón GENERACIÓN CHEQUERA
    Given El ejecutivo se encuentra en la pantalla de resumen de datos
    When Se pulsa el botón ACEPTAR
    And Aparece un pop-up con las siguientes opciones:
      | ASIGNACIÓN TARJETA DÉBITO      |
      | GENERACIÓN CHEQUERA (opcional) |
    And Se pulsa sobre el botón GENERACIÓN CHEQUERA
    Then Se redirige al flujo de GENERACIÓN CHEQUERA




