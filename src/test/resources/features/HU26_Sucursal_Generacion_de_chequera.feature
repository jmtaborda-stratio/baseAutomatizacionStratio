Feature: HU26 Generacion de Chequera
  COMO cliente
  QUIERO tener la posibilidad de emitir cheques personales
  PARA la mejor administración de mis recursos

  Background:
    Given El ejecutivo realiza el proceso de UPGRADE CUENTA CONECTA SIN LÍMITE

  Scenario: Botón de UPGRADE CUENTA CONECTA SIN LÍMITE
    Given El ejecutivo se encuetra en el pop-up de elección entre ASIGNACIÓN TARJETA DÉBITO y GENERACIÓN CHEQUERA
    When Se pulsa el boton GENERACIÓN CHEQUERA
    Then Se despliega la pantalla que indica la leyenda "¿Se requiere contratar chequera para la cuenta Conecta?"
    And La pantalla incluye un botón de CONFIRMAR y otro REGRESAR.
    And La pantalla incluiye la leyenda "Con el primer depósito a la cuenta, se genera la chequera de 25 cheques sin renovación automática"


  Scenario: Botón de CONFIRMAR
    Given El ejecutivo se encuetra en la pantalla de generación de chequera
    When Se pulsa el boton CONFIRMAR
    Then Se solicita la chequera y se muestra un mensaje con la leyenda "Solicitud exitosa" aparece el botón CONTINUAR

  Scenario: Botón de REGRESAR
    Given El ejecutivo se encuetra en el pop-up de elección entre ASIGNACIÓN TARJETA DÉBITO y GENERACIÓN CHEQUERA
    When Se pulsa el boton GENERACIÓN CHEQUERA
    And Se pulsa el boton REGRESAR
    And Se regresa al pop-up de elección entre ASIGNACIÓN TARJETA DÉBITO y GENERACIÓN CHEQUERA