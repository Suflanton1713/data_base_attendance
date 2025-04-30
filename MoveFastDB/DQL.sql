-- Obtener los vehículos disponibles en una ciudad específica. (Una sucursal de una ciudad específica)

SELECT v.placa, v.marca, v.modelo, v.ciudad
FROM vehiculo v
JOIN sucursal s ON v.sucursal_id = s.su_id
WHERE s.ciudad = 'Medellín'  -- Cambia 'Medellín' por la ciudad que desees
  AND v.estado = TRUE;

-- Listar los alquileres activos con información del cliente y vehículo.

SELECT s.nombre AS sucursal, SUM(p.monto) AS ingresos_totales
FROM sucursal s
JOIN vehiculo v ON s.su_id = v.sucursal_id
JOIN alquiler a ON v.placa = a.placa_v 
JOIN pago p ON a.al_id = p.alquiler_id
WHERE 
    v.placa IN (
        SELECT placa_v
        FROM alquiler
        GROUP BY placa_v
        HAVING COUNT(al_id) > 3
    )
GROUP BY s.nombre;


-- Filtrar solo vehículos con más de 5 alquileres (usar subconsulta)

SELECT *
FROM vehiculo v
WHERE v.placa IN (
    SELECT placa_v
    FROM alquiler
    GROUP BY placa_v
    HAVING COUNT(*) > 5
);


-- Sumar los montos de todos los pagos asociados


SELECT SUM(p.monto) AS total_pagos
FROM pago p;





