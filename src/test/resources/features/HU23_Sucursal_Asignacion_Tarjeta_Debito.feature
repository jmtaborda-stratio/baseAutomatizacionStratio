Feature: HU23 Asignación de la Tarjeta de Débito
  COMO cliente
  QUIERO contar con medios de disposición
  PARA el uso de mis recursos

  Background:
    Given El ejecutivo realiza el proceso éxitoso de enrolamiento de un cliente

  Scenario: Información de la Tarjeta de Débito
    Given El ejecutivo se encuetra en el pop-up de elección
    When Se pulsa el boton ASIGNACIÓN TARJETA DÉBITO
    Then Se despliega una pantalla que indica los datos siguientes:
      | Número de Cuenta: XXXXXX                                                       |
      | Id Cliente Único                                                               |
      | Número de Tarjeta de Débito Asignada: (primeros 6 dígitos y últimos 4 dígitos) |
      | Botón que indique "Envío de Código Temporal de Tarjeta" vía SMS                |

  Scenario:  Botón Envío de Código Temporal de Tarjeta
    Given El ejecutivo se encuetra en la pantalla de información de Tarjeta de Débito
    When Se pulsa el Botón Envío de Código Temporal de Tarjeta
    Then  El sistema envía la señal al sistema de Notificaciones para que se detone un SMS con el código temporal de la TDD
    And Se envia un SMS al celular registrado del cliente con un código temporal de 4 números relacionados a su TDD
    And Al momento de ingresar el Código Temporal recibido en el SMS en un ATM, la TDD cambiar de estatus ENTREGADO a estatus ACTIVO
    And El Código Temporal debe ser modificado por el cliente al momento de activar su Tarjeta en el ATM de BB y en el ATM de cualquier banco nacional

  Scenario:  Stock de tarjetas de debito
    When El ejecutivo se encuetra en la pantalla de información de Tarjeta de Débito
    Then La plataforma debe contar con la información para reconocer el stock de TDD disponibles en cada sucursal con base al BP del ejecutivo y al usuario de la plataforma que está realizando la apertura
