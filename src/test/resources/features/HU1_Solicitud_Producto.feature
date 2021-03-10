Feature: HU01 Usuario que inicia en remoto solicita producto
  COMO usuario de internet
  QUIERO seleccionar un producto de BB
  PARA abrir una cuenta de vista

  Background:
    Given La pagina es visible y responsiva

    Scenario: Acceso correcto a Conecta BanBajio
      Given El boton ABRE TU CUENTA debe resaltar en forma y fondo del texto contenido en la pagina
      When Se pulsa el boton ABRE TU CUENTA
      Then La aplicacion te dirige al menu de Personas Fisicas / Cuentas / Conecta BanBajio

      Scenario: Inicio del flujo CLIENTE INICIA REMOTO-TERMINA SUCURSAL
        Given La pagina contiene informacion de la cuenta
        And Existe el boton YA SOY CLIENTE BB Y QUIERO ABRIR MI CUENTA
        And Existe el boton QUIERO SER CLIENTE Y ABRIR MI CUENTA
        When Se pulsa el boton YA SOY CLIENTE BB Y QUIERO ABRIR MI CUENTA
        Then Dará seguimiento al flujo de CLIENTE INICIA REMOTO-TERMINA SUCURSAL

        Scenario: Inicio del flujo NO CLIENTE INICIA REMOTO-TERMINA SUCURSAL
          Given La pagina contiene informacion de la cuenta
          And Existe el boton YA SOY CLIENTE BB Y QUIERO ABRIR MI CUENTA
          And Existe el boton QUIERO SER CLIENTE Y ABRIR MI CUENTA
          When Se pulsa el boton QUIERO SER CLIENTE Y ABRIR MI CUENTA
          Then Dará seguimiento al flujo de NO CLIENTE INICIA REMOTO-TERMINA SUCURSAL
