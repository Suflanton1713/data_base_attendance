INSERT INTO Cliente (id_cliente, nombre, apellido, observaciones) VALUES
(1, 'Alejandro', 'Quintero', 'Cliente frecuente'),
(2, 'Maria Juliana', 'Saavedra', 'Visita semanalmente'),
(3, 'Juan David', 'Rincón', 'Le gusta la comida rápida'),
(4, 'Carlos', 'Mendoza', 'Cliente nuevo'),
(5, 'Ana', 'Martínez', 'Le gusta lo picante'),
(6, 'Lucía', 'Gómez', 'Comer en familia'),
(7, 'Felipe', 'González', 'Cliente corporativo'),
(8, 'Sofia', 'Ramírez', 'Siempre pide lo mismo'),
(9, 'Manuel Pedroza', 'González', 'Amante de las bebidas dulces'),
(10, 'Paola', 'Muñoz', 'Disfruta de la comida tradicional colombiana');

INSERT INTO Mesero (id_mesero, nombre, apellido1, apellido2) VALUES
(1, 'Luis', 'Pérez', 'Ramírez'),
(2, 'Carlos', 'Díaz', NULL),
(3, 'Verónica', 'Martínez', 'Gómez'),
(4, 'Andrés', 'Sánchez', NULL),
(5, 'Juliana', 'Hernández', 'Álvarez');


INSERT INTO Platillo (id_platillo, nombre, importe) VALUES
(1, 'Arepa con huevo', 15000),
(2, 'Ajiaco', 30000),
(3, 'Bandeja paisa', 45000),
(4, 'Sancocho', 35000),
(5, 'Arroz a la marinera', 55000),
(6, 'Lechona', 60000),
(7, 'Empanada', 10000),
(8, 'Tamales', 20000),
(9, 'Pescado frito', 40000),
(10, 'Arroz con pollo', 30000);


INSERT INTO Bebida (id_bebida, nombre, importe) VALUES
(1, 'Jugo de lulo', 8000),
(2, 'Aguapanela', 6000),
(3, 'Jugo de maracuyá', 8000),
(4, 'Cerveza Águila', 12000),
(5, 'Café tinto', 5000),
(6, 'Jugo de guanábana', 8000),
(7, 'Chicha', 7000),
(8, 'Refresco de cola', 7000),
(9, 'Cerveza Club Colombia', 15000),
(10, 'Jugo de mora', 8000);


INSERT INTO Mesa (id_mesa, num_comensales, ubicacion) VALUES
(1, 4, 'Primer piso'),
(2, 2, 'Segundo piso'),
(3, 6, 'Primer piso'),
(4, 4, 'Segundo piso'),
(5, 2, 'Primer piso'),
(6, 4, 'Segundo piso'),
(7, 4, 'Primer piso'),
(8, 4, 'Segundo piso'),
(9, 2, 'Primer piso'),
(10, 6, 'Segundo piso');


INSERT INTO Factura (id_factura, fecha_factura, id_cliente, id_mesero, id_mesa, id_platillo, id_bebida) VALUES
(1, '2025-04-10', 1, 1, 1, 5, 1),  -- Alejandro Quintero, Arroz a la marinera, Jugo de lulo
(2, '2025-04-11', 2, 2, 2, 3, 2),  -- Maria Juliana Saavedra, Bandeja paisa, Aguapanela
(3, '2025-04-12', 3, 3, 3, 4, 3),  -- Juan David Rincón, Sancocho, Jugo de maracuyá
(4, '2025-04-12', 4, 4, 4, 1, 4),  -- Carlos Mendoza, Arepa con huevo, Cerveza Águila
(5, '2025-04-13', 5, 5, 5, 7, 5),  -- Ana Martínez, Empanada, Café tinto
(6, '2025-04-13', 6, 1, 6, 9, 6),  -- Lucía Gómez, Pescado frito, Jugo de guanábana
(7, '2025-04-14', 7, 2, 7, 2, 7),  -- Felipe González, Ajiaco, Chicha
(8, '2025-04-14', 8, 3, 8, 6, 8),  -- Sofia Ramírez, Lechona, Refresco de cola
(9, '2025-04-15', 9, 4, 9, 8, 9),  -- Manuel Pedroza González, Tamales, Cerveza Club Colombia
(10, '2025-04-15', 10, 5, 10, 10, 10);  -- Paola Muñoz, Arroz con pollo, Jugo de mora
