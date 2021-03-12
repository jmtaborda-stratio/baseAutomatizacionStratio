Feature: HU24 Envio por correo electronico e impresion de documentos
  COMO ejecutivo
  QUIERO enviar todos los documentos a impresión con un sólo botón; así como enviarle al cliente sus clausulados vía correo electrónico
  PARA imprimirlos con un sólo botón

  Background:
    Given El ejecutivo realiza el proceso éxitoso de enrolamiento de un cliente

  Scenario:  Botón Envío de Código Temporal de Tarjeta
    Given El ejecutivo se encuetra en la pantalla de información de Tarjeta de Débito
    When Se pulsa el Botón Envío de Código Temporal de Tarjeta
    Then  se despliega una pantalla donde se indica el envío por correo electrónico de los clausulados y el total de documentos que se imprimirán para la firma del cliente:
      | Mensaje: Ya casi terminas la apertura de Cuenta sólo imprime y firma  lo siguiente |
      | Carátula de producto y Servicios                                                   |
      | Anexo de Contrato                                                                  |
      | KYC Simplificado                                                                   |
      | Anexo de Beneficiarios                                                             |
      | Contratación Bajionet                                                              |
    And es visible el botón IMPRIMIR
    And es visible el botón ENVIAR CLAUSULADOS

  Scenario:  Avisos impresion completa
    Given El ejecutivo se encuetra en la pantalla de información de Tarjeta de Débito
    When Se pulsa el boton IMPRIMIR
    Then La plataforma lanzará dos avisos:
      | Impresión lista, por favor recaba la firma del cliente.                   |
      | Enviamos los clausulados al correo XXXXX@xxx.xxxx registrado en la cuenta |




