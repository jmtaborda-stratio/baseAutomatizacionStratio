Feature: HU03 Verificacion del celular y el correo introducidos por el cliente
  COMO dueño de producto
  QUIERO que el celular y el correo electrónico se certifiquen con un OTP
  PARA contar con información real y de calidad en las bases de datos

  Background:
    Given En la pantalla se muestra la leyenda 'Necesitamos verificar tu información'
    And Se muestra un campo para capturar el OTP del numero celular
    And Se muestra un campo para capturar el OTP del correo electronico

