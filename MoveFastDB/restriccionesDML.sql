--Errores de cliente, sucursal, vehículo para verificar NOT NULL y CHECK 

--nombre vacío (CHECK LENGTH(nombre) > 0)
INSERT INTO cliente VALUES 
(1111111111, '', 'Quintero', 'alejandro@example.com', '3109998888');

-- apellido vacío
INSERT INTO cliente VALUES 
(2222222222, 'Alejandro', '', 'alejandro@example.com', '3109998888');

-- correo inválido (sin punto)
INSERT INTO cliente VALUES 
(3333333333, 'Alejandro', 'Quintero', 'correo@invalido', '3109998888');

-- correo inválido (sin @)
INSERT INTO cliente VALUES 
(4444444444, 'Alejandro', 'Quintero', 'correoinvalido.com', '3109998888');

-- teléfono demasiado largo
INSERT INTO cliente VALUES 
(5555555555, 'Alejandro', 'Quintero', 'alejandro@example.com', '1234567890123456');

--  su_id vacío
INSERT INTO sucursal VALUES 
('', 'Sucursal Norte', 'Bogotá', '3015551111');


--  ciudad nula
INSERT INTO sucursal VALUES 
('S02', 'Sucursal Sur', NULL, '3015551111');


--  modelo fuera del rango permitido,
INSERT INTO vehiculo VALUES 
('ZZZ002', 'Chevrolet', 'Medellín', 1990, TRUE, NULL);

--Errores en pago para verificar ambos checks

--  monto cero
INSERT INTO pago (alquiler_id, monto) VALUES (1, 0);

--  monto negativo
INSERT INTO pago (alquiler_id, monto) VALUES (1, -5000);

-- fecha futura
INSERT INTO pago (alquiler_id, monto, fecha_pago)
VALUES (1, 30000, CURRENT_TIMESTAMP + INTERVAL '2 day');

-- alquiler no existe
INSERT INTO pago (alquiler_id, monto) VALUES (999, 20000);




--Verificar el funcionamiento del ON DELETE CASCADE de al eliminar cliente borrarse el alquiler.

-- Crear cliente y alquiler relacionado
INSERT INTO cliente VALUES (8888888888, 'Mario', 'Torres', 'mario@ejemplo.com', '3110000000');

-- Requiere un vehículo válido..
INSERT INTO vehiculo VALUES ('DEL123', 'Renault', 'Bogotá', 2023, TRUE, NULL);

INSERT INTO alquiler (cc_cliente, placa_v, fecha_inicio, fecha_fin) 
VALUES (8888888888, 'DEL123', '2025-01-10', '2025-01-20');

-- Verificar que el alquiler existe
SELECT * FROM alquiler WHERE cc_cliente = 8888888888;

-- Eliminar cliente (debería borrar también el alquiler)
DELETE FROM cliente WHERE cedula = 8888888888;

-- Verificar eliminación en cascada
SELECT * FROM alquiler WHERE cc_cliente = 8888888888;


--Verificar el funcionamiento del ON UPDATE CASCADE donde al actualizar sucursal se actualiza en vehículo.

-- insertar sucursal y vehículo asociado
INSERT INTO sucursal VALUES ('OLD002', 'Sucursal Vieja', 'Bogotá', '3010000000');

INSERT INTO vehiculo VALUES ('UPD124', 'Nissan', 'Bogotá', 2022, TRUE, 'OLD002');

-- Verificar el vehículo
SELECT * FROM vehiculo WHERE placa = 'UPD124';

-- Actualizar clave primaria de la sucursal
UPDATE sucursal SET su_id = 'NEW002' WHERE su_id = 'OLD002';

-- Verificar que el cambio se refleje en vehiculo
SELECT * FROM vehiculo WHERE placa = 'UPD124';



--Verificar el funcionamiento del ON DELETE SET NULL con las sucursales y vehículos igualmente.

-- Crear sucurwsal y vehículo asociado
INSERT INTO sucursal VALUES ('TEMP001', 'Sucursal Temporal', 'Manizales', '3011111111');

INSERT INTO vehiculo VALUES ('SET001', 'Peugeot', 'Manizales', 2024, TRUE, 'TEMP001');

-- Verifica que el vehículo está vinculado a la sucursal
SELECT * FROM vehiculo WHERE placa = 'SET001';

-- Eliminar sucursal TEMP001
DELETE FROM sucursal WHERE su_id = 'TEMP001';

-- Verificar que el campo sucursal_id del vehículo quedó en NULL
SELECT * FROM vehiculo WHERE placa = 'SET001';



--Verificar el funcionamiento del DEFAULT en fechas de alquiler y de pago.

-- Se omite la fecha de inicio (tomará la fecha actual automáticamente)
INSERT INTO alquiler (cc_cliente, placa_v, fecha_fin)
VALUES (1234567890, 'DEF111', '2025-05-10');

-- Verifica la fecha de inicio generada por defecto
SELECT * FROM alquiler WHERE placa_v = 'DEF111';

-- se omite la fecha_pago, tomará el timestamp actual
INSERT INTO pago (alquiler_id, monto)
VALUES (1, 100000.00);

-- Vverifica la fecha generada automáticamente
SELECT * FROM pago WHERE alquiler_id = 1 ORDER BY fecha_pago DESC;
