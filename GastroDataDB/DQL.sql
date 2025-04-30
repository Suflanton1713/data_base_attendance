--Obtener el nombre y apellido de los clientes que hayan consumido un platillo específico.
SELECT c.nombre, c.apellido, p.nombre
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE f.id_platillo = 3;

--Obtener el nombre y apellido de los clientes que hayan consumido arroz a la marinera.

SELECT c.nombre, c.apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.nombre = 'Arroz a la marinera';


--Listar el nombre del mesero y la fecha en la que atendió una mesa 10 que se encuentra ubicada en el segundo piso del restautante.

SELECT m.nombre, m.apellido1, m.apellido2, f.fecha_factura
FROM Factura f
JOIN Mesero m ON f.id_mesero = m.id_mesero
JOIN Mesa me ON f.id_mesa = me.id_mesa
WHERE me.id_mesa = 10 AND me.ubicacion = 'Segundo piso';


--Mostrar el nombre de los clientes junto con los nombres de las bebidas que consumieron en sus facturas.

SELECT c.nombre, c.apellido, b.nombre AS bebida
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Bebida b ON f.id_bebida = b.id_bebida;


--Consultar todas las facturas que incluyan platillos con un importe mayor a $300000, incluyendo el nombre del cliente y del platillo.

SELECT f.id_factura, c.nombre, c.apellido, p.nombre AS platillo, p.importe
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.importe > 300000;

--Listar el total de consumo (importe de platillos y bebidas) del cliente llamado Manuel Pedroza Gonzalez.
--Usamos el Coalesce para que si devuelve null entonces ponga 0
SELECT c.nombre, c.apellido, 
       COALESCE(p.importe, 0) + b.importe AS total_consumo
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
WHERE c.nombre = 'Manuel Pedroza' AND c.apellido = 'González';

--Liste las mesas que han sido utilizadas al menos una vez, indicando su ubicación y el número de comensales
SELECT DISTINCT me.id_mesa, me.ubicacion, me.num_comensales
FROM Mesa me
JOIN Factura f ON me.id_mesa = f.id_mesa;


--VISTAS

--Cree una vista (VIEW) que presente del consumo de cada cliente (nombre, bebida, platillo, fecha y montos).
CREATE VIEW ConsumoCliente AS
SELECT 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido, 
    p.nombre AS platillo_nombre, 
    b.nombre AS bebida_nombre, 
    f.fecha_factura AS fecha, 
    COALESCE(p.importe, 0) + b.importe AS monto_total
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida;

-- Cree una vista (VIEW) que presente el mesero, el numero de factura que atendió, la fecha y la mesa.

CREATE VIEW FacturasPorMesero AS
SELECT 
    m.nombre AS mesero_nombre, 
    m.apellido1 AS mesero_apellido, 
    f.id_factura, 
    f.fecha_factura, 
    me.ubicacion AS mesa_ubicacion, 
    me.num_comensales AS mesa_num_comensales
FROM Factura f
JOIN Mesero m ON f.id_mesero = m.id_mesero
JOIN Mesa me ON f.id_mesa = me.id_mesa;

-- Cree una vista (VIEW) que el valor total de compra por cada cliente en todas sus facturas (platillo + bebida).

CREATE VIEW TotalCompraCliente AS
SELECT 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido, 
    SUM(COALESCE(p.importe, 0) + b.importe) AS total_compra
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
GROUP BY c.id_cliente;

-- Conviera a vista las consultas 6 y 7 del anterior ejercicio

--ejercicio 6

CREATE VIEW TotalConsumoManuel AS
SELECT 
    c.nombre, 
    c.apellido, 
    COALESCE(p.importe, 0) + b.importe AS total_consumo
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
WHERE c.nombre = 'Manuel Pedroza' AND c.apellido = 'González';

--ejerciico 7

CREATE VIEW MesasUsadas AS
SELECT 
    m.ubicacion, 
    m.num_comensales
FROM Mesa m
JOIN Factura f ON f.id_mesa = m.id_mesa
GROUP BY m.id_mesa, m.ubicacion, m.num_comensales;
