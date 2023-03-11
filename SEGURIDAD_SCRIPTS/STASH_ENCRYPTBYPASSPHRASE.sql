--ENCRYPTBYPASSPHRASE--

--CREAMOS LA TABLA TARJETA CON EL CAMPO CORRESPONDIENTE (VARBINARY) EL CUAL SER� ENCRIPTADO--

--ELIMINAMOS LA TABLA TARJETA EXISTENTE--

DROP TABLE TARJETA
GO

CREATE TABLE TARJETA (
	ID_TARJETA INT IDENTITY (1,1),
	NUMERO VARBINARY(128),
	CVV VARBINARY (128),
	FECHA_CADUCIDAD DATE)
GO

--INSERTAMOS UN VALOR--

INSERT INTO TARJETA (NUMERO, CVV, FECHA_CADUCIDAD)
VALUES (
	CONVERT(VARBINARY(128), '2528363914178582'),
	ENCRYPTBYPASSPHRASE('STASHMOTOR_FRASE_SECRETA', '422'),
	'2025-06-25'
);

--HACEMOS UN SELECT SOBRE LA TABLA--

SELECT * FROM TARJETA
GO

--DESENCRIPTAR EL CONTENIDO--

--PRIMERAMENTE INTENTAMOS HACERLO CON UNA FRASE INCORRECTA, PARA DEMOSTRAR QUE FUNCIONA CORRECTAMENTE--

SELECT ID_TARJETA, NUMERO, CONVERT(VARCHAR(50), DECRYPTBYPASSPHRASE('NOSELACLAVE', CVV)) AS CVV, FECHA_CADUCIDAD
FROM TARJETA;

--NOS MUESTRA EL CONTENIDO NULL, PUESTO QUE LA FRASE ES INCORRECTA--

--ESTA VEZ INSERTAMOS LA FRASE CORRECTA--

SELECT ID_TARJETA, NUMERO, CONVERT(VARCHAR(50), DECRYPTBYPASSPHRASE('STASHMOTOR_FRASE_SECRETA', CVV)) AS CVV, FECHA_CADUCIDAD
FROM TARJETA;



