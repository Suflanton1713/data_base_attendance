-- Obtener los vehículos disponibles en una ciudad específica. (Una sucursal de una ciudad específica)

SELECT v.placa, v.marca, v.modelo, v.ciudad
FROM vehiculo v
JOIN sucursal s ON v.sucursal_id = s.su_id
WHERE s.ciudad = 'Medellín'  -- Cambia 'Medellín' por la ciudad que desees
  AND v.estado = TRUE;

-- Listar los alquileres activos con información del cliente y vehículo.

SELECT 
    a.al_id,
    c.nombre,
    c.apellido,
    c.telefono,
    c.correo,
    v.placa,
    v.marca,
    v.modelo,
    v.ciudad,
    a.fecha_inicio,
    a.fecha_fin
FROM alquiler a
JOIN cliente c ON a.cc_cliente = c.cedula
JOIN vehiculo v ON a.placa_v = v.placa
WHERE a.fecha_fin >= CURRENT_DATE;  -- Filtra alquileres activos


