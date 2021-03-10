Feature: Asignacion de Cuenta
  COMO ejecutivo
  QUIERO que la plataforma asigne un número de cuenta
  PARA la fácil identificación del producto del cliente
  Background:
    Given El ejecutivo realiza el proceso éxitoso de enrolamiento de un cliente

  Scenario: Proceso éxitoso de enrolamiento
    When Se realiza el proceso de enrolamiento con exito
    Then la plataforma indicará que todos los datos del cliente están completos
    And  Los datos que falten de completar en el proceso deberán estar señalados en un color distinto dentro de los pasos del menú de la izquierda

  Scenario: Boton ASIGNAR CUENTA CONECTA
    Given Se realiza el proceso de enrolamiento con exito
    When La pantalla muestra un botón ASIGNAR CUENTA CONECTA
    And Se pulsa el boton ASIGNAR CUENTA CONECTA
    Then La pantalla pide confirmación al ejecutivo para que la cuenta quede ASIGNADA con el mensaje "Estás por Asignar la cuenta al cliente, por favor confirma que la información es correcta antes de aceptar"
    And El sistema deberá desplegar una pantalla donde se indique los datos siguientes:
      | Nombre Completo del Cliente                                                                  |
      | ID UNICO de CLIENTE                                                                          |
      | Nombre del producto: CUENTA CONECTA                                                          |
      | Características básicas del producto: N4 con límite de depósitos mensuales de $180,000 pesos |
      | Número de Cuenta: XXXXXXX                                                                    |
      | Número de Cuenta Clabe: (18 posiciones)                                                      |
      | Estatus de la Cuenta: ACTIVO                                                                 |
    And el botón de ACEPTAR es visible en tono diferente y distinguirse del texto

  Scenario:  ASIGNAR CUENTA CONECTA -  ASIGNACIÓN TARJETA DÉBITO / UPGRADE CUENTA CONECTA SIN LÍMITE
    Given El ejecutivo se encuetra en la pantalla de confirmación de información
    When Se pulsa en el boton ACEPTAR
    Then Se despliega un pop-up con dos botones
      | ASIGNACIÓN TARJETA DÉBITO         |
      | UPGRADE CUENTA CONECTA SIN LÍMITE |

  Scenario:  CUENTA CONECTA asignada - no permitir modificación de información
    When Se ha realizado el proceso completo de asignación Cuenta Conecta
    Then el sistema no permitirá realizar modificaciones en la inforamción previamente capturada, fuera del flujo de ACTUALIZACIÓN DE INFORMACIÓN
