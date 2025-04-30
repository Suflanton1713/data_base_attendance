-- insertamos los clientes
INSERT INTO cliente VALUES 
(1000000001, 'Alejandro', 'Quintero', 'alejandro.q@example.com', '3101234567'),
(1000000002, 'Juliana', 'Saavedra', 'juliana.s@example.com', '3122345678'),
(1000000003, 'Carlos', 'Gómez', 'carlos.gomez@example.com', '3133456789'),
(1000000004, 'Mariana', 'Lozano', 'mariana.lozano@example.com', '3144567890'),
(1000000005, 'Luis', 'Rodríguez', 'luis.rodriguez@example.com', '3155678901'),
(1000000006, 'Ana', 'Pérez', 'ana.perez@example.com', '3166789012'),
(1000000007, 'Pedro', 'Martínez', 'pedro.martinez@example.com', '3177890123'),
(1000000008, 'Laura', 'Mendoza', 'laura.mendoza@example.com', '3188901234'),
(1000000009, 'Juan', 'Sánchez', 'juan.sanchez@example.com', '3199012345'),
(1000000010, 'Sofía', 'Ramírez', 'sofia.ramirez@example.com', '3200123456');

-- insertamos las sucursales
INSERT INTO sucursal VALUES 
('SUBO001', 'Sucursal Bogotá', 'Bogotá', 'Calle 100 #45-30'),
('SUME002', 'Sucursal Medellín', 'Medellín', 'Carrera 50 #15-20'),
('SUCA003', 'Sucursal Cali', 'Cali', 'Avenida 6 #10-15'),
('SUBA004', 'Sucursal Barranquilla', 'Barranquilla', 'Calle 30 #10-25'),
('SUCAR005', 'Sucursal Cartagena', 'Cartagena', 'Avenida 1 #30-45'),
('SUBU006', 'Sucursal Bucaramanga', 'Bucaramanga', 'Carrera 27 #15-35'),
('SUMAN007', 'Sucursal Manizales', 'Manizales', 'Calle 15 #5-10'),
('SUCU008', 'Sucursal Cúcuta', 'Cúcuta', 'Carrera 10 #3-15'),
('SUPER009', 'Sucursal Pereira', 'Pereira', 'Calle 8 #12-40'),
('SUME010', 'Sucursal Medellín Norte', 'Medellín', 'Carrera 60 #23-25');

--insertamos los  vehiculos
INSERT INTO vehiculo VALUES
('ABC101', 'Renault', 'Bogotá', 2018, TRUE, 'SUBO001'),
('DEF202', 'Chevrolet', 'Medellín', 2020, TRUE, 'SUME002'),
('GHI303', 'Mazda', 'Cali', 2021, TRUE, 'SUCA003'),
('JKL404', 'Kia', 'Barranquilla', 2019, TRUE, 'SUBA004'),
('MNO505', 'Nissan', 'Cartagena', 2022, TRUE, 'SUCAR005'),
('PQR606', 'Hyundai', 'Bucaramanga', 2023, TRUE, 'SUBU006'),
('STU707', 'Toyota', 'Manizales', 2020, TRUE, 'SUMAN007'),
('VWX808', 'Ford', 'Cúcuta', 2017, TRUE, 'SUCU008'),
('YZA909', 'Volkswagen', 'Pereira', 2021, TRUE, 'SUPER009'),
('BCD010', 'Suzuki', 'Medellín', 2024, TRUE, 'SUME010');


--insertamos los alquileres
INSERT INTO alquiler (cc_cliente, placa_v, fecha_inicio, fecha_fin) VALUES
(1000000001, 'ABC101', '2025-04-30', '2025-05-05'),
(1000000002, 'DEF202', '2025-04-20', '2025-04-25'),
(1000000003, 'GHI303', '2025-04-10', '2025-04-15'),
(1000000004, 'JKL404', '2025-03-31', '2025-04-05'),
(1000000005, 'MNO505', '2025-03-21', '2025-03-26'),
(1000000006, 'PQR606', '2025-03-11', '2025-03-16'),
(1000000007, 'STU707', '2025-03-01', '2025-03-06'),
(1000000008, 'VWX808', '2025-02-19', '2025-02-24'),
(1000000009, 'YZA909', '2025-02-09', '2025-02-14'),
(1000000010, 'BCD010', '2025-01-30', '2025-02-04'),
(1000000001, 'ABC101', '2025-01-01', '2025-01-06'),
(1000000002, 'ABC101', '2025-01-10', '2025-01-15'),
(1000000003, 'ABC101', '2025-01-20', '2025-01-25'),
(1000000004, 'ABC101', '2025-02-01', '2025-02-06'),
(1000000005, 'ABC101', '2025-02-10', '2025-02-15'),
(1000000002, 'DEF202', '2025-01-01', '2025-01-05'),
(1000000002, 'DEF202', '2025-01-07', '2025-01-12'),
(1000000002, 'DEF202', '2025-01-14', '2025-01-19'),
(1000000003, 'GHI303', '2025-01-02', '2025-01-07'),
(1000000003, 'GHI303', '2025-01-09', '2025-01-14'),
(1000000003, 'GHI303', '2025-01-16', '2025-01-21'),
(1000000003, 'JKL404', '2025-04-01', '2025-05-06'),
(1000000004, 'MNO505', '2025-04-05', '2025-05-10'),
(1000000005, 'PQR606', '2025-04-10', '2025-05-15');



--insertamos los pagos
INSERT INTO pago (alquiler_id, monto, fecha_pago) VALUES
(1, 350000, '2025-04-01 10:00:00'),
(2, 420000, '2025-04-20 09:30:00'),
(3, 300000, '2025-04-10 11:15:00'),
(4, 390000, '2025-04-05 08:45:00'),
(5, 450000, '2025-03-21 10:20:00'),
(6, 280000, '2025-03-16 12:10:00'),
(7, 310000, '2025-03-06 14:00:00'),
(8, 360000, '2025-02-24 16:30:00'),
(9, 330000, '2025-02-14 13:00:00'),
(10, 400000, '2025-02-04 17:45:00'),
(11, 250000, '2025-01-06 08:30:00'),
(12, 260000, '2025-01-15 09:00:00'),
(13, 270000, '2025-01-25 10:15:00'),
(14, 280000, '2025-02-06 11:00:00'),
(15, 290000, '2025-02-15 11:30:00'),
(16, 240000, '2025-01-05 09:45:00'),
(17, 245000, '2025-01-12 10:00:00'),
(18, 250000, '2025-01-19 10:30:00'),
(19, 230000, '2025-01-07 08:00:00'),
(20, 235000, '2025-01-14 08:15:00'),
(21, 240000, '2025-01-21 08:45:00'),
(11, 320000, '2025-04-01 10:00:00'),
(12, 380000, '2025-04-05 14:30:00'),
(13, 400000, '2025-04-10 16:00:00');
