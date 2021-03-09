Feature: Upgrade N4 FULL
  Como cliente
  QUIERO contar con una cuenta que me permita recibir depósitos mensuales superiores a $180K

  Background:
    Given El ejecutivo realiza el proceso éxitoso de enrolamiento de un cliente

  Scenario: Botón de UPGRADE CUENTA CONECTA SIN LÍMITE
    Given El ejecutivo se encuetra en el pop-up de elección
    When Se pulsa el boton UPGRADE CUENTA CONECTA SIN LÍMITE
    Then Se despliega una pantalla con el mensaje "Estás habilitando una Cuenta Conecta N4 sin tope en el límite de depósitos mensuales. Por favor contesta el siguiente cuestionario"
    And Se despliega el KYC completo para que el ejecutivo pueda recabar la información complementaria
