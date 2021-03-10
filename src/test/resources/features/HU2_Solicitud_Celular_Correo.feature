Feature: HU02 Usuario no cliente que inicia el proceso de apertura de cuenta
  COMO prospecto
  QUIERO ingresar mi número de celular y correo electrónico en una pantalla
  PARA continuar con la apertura de la cuenta

  Background:
    Given La pantalla contiene la leyenda 'Bienvenido! Empecemos a conectar' y 'Empecemos a conectar'
    And El campo Celular muestra en una fuente mas clara que son 10 digitos
    And El campo Correo Electronico muestra la palabra ejemplo@mail.com
    And Se muestra un checkbox con la leyenda 'Acepto el aviso de privacidad, los Términos y Condiciones de Uso y el envío de comunicación por cualquier medio de parte de BanBajío'
    And En la parte inferior, debe haber un boton con el nombre 'CONECTEMOS'

    Scenario Outline: Validacion del campo celular introduciendo un valor correcto
      When Se introduce en el campo celular el valor "<valorCelular>"
      Then La aplicacion no muestra ningun error al introducir el valor
      Examples:
        | valorCelular    |
        | 612 123 321 458 |
        | 612 123 321 458 |
        | 612 123 321 458 |
        | 612 123 321 458 |

    Scenario Outline: Validacion del campo celular introduciendo un valor incorrecto
      When Se introduce en el campo celular el valor "<valorCelular>"
      Then La aplicacion muestra el error de valor incorrecto en el campo celular
      Examples:
        | valorCelular       |
        | 612 123 321        |
        | 612 123 321 123458 |
        | 612 123 321 45     |
        | 612 123 321 4158   |

    Scenario Outline: Validacion del campo correo electronico introduciendo un valor correcto
      When Se introduce en el campo Correo Electronico el valor "<valorCorreoElectronico>"
      And Se introduce en el campo Confirmar Correo Electronico el valor "<valorCorreoElectronico>"
      Then La aplicacion no muestra ningun error al introducir el valor en ambos campos
      Examples:
        | valorCorreoElectronico |
        | test1@mail.com         |
        | mail1@test.com         |
        | test2@test.com         |
        | mail2@mail.com         |

    Scenario Outline: Validacion del campo correo electronico introduciendo un valor incorrecto
      When Se introduce en el campo Correo Electronico el valor "<valorCorreoElectronico>"
      Then La aplicacion muestra el error de valor incorrecto en el campo Correo Electronico
      Examples:
        | valorCorreoElectronico |
        | test1                  |
        | @test.com              |
        | test2test.com          |
        | mail2@mail             |

    Scenario: Interaccion con los links de la pagina
      When Se pulsa sobre el link de Aviso de Privacidad, se abre una nueva pantalla que muestre el aviso de privacidad de BanBajío.
      And Se pulsa sobre el link de Términos y Condiciones de Uso se abre una nueva pantalla que muestre los TyC de BB.


    Scenario Outline: Acceso de apertura de cuenta correcto
      When Se introduce en el campo celular el valor "<valorCelular>"
      When Se introduce en el campo Correo Electronico el valor "<valorCorreoElectronico>"
      And Se introduce en el campo Confirmar Correo Electronico el valor "<valorCorreoElectronico>"
      And Se pulsa el boton CONECTEMOS
      Then La aplicacion nos redirige a la pantalla de apertura de cuenta
      Examples:
        | valorCelular    | valorCorreoElectronico |
        | 612 123 321 458 | mail2@mail.com         |
        | 612 123 321 458 | mail2@mail.com         |
        | 612 123 321 458 | mail2@mail.com         |
        | 612 123 321 458 | mail2@mail.com         |


