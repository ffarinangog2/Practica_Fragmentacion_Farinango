-- =========================================================
-- VERIFICACION FINAL DE LA FRAGMENTACION
-- =========================================================

-- 1) COMPLETITUD HORIZONTAL
-- La vista global debe tener las mismas filas que la tabla central original.
SELECT
    'pedidos_central' AS origen,
    COUNT(*) AS total_filas
FROM pedidos_central

UNION ALL

SELECT
    'pedidos_global' AS origen,
    COUNT(*) AS total_filas
FROM pedidos_global;


-- 2) RECONSTRUCCION HORIZONTAL
-- La suma por sede debe coincidir con la tabla centralizada.
SELECT
    'central' AS origen,
    sede,
    SUM(monto) AS total
FROM pedidos_central
GROUP BY sede

UNION ALL

SELECT
    'global' AS origen,
    sede,
    SUM(monto) AS total
FROM pedidos_global
GROUP BY sede
ORDER BY sede, origen;


-- 3) DISJUNCION HORIZONTAL
-- Ningun pedido debe aparecer en mas de un fragmento.
SELECT
    pedido_id,
    COUNT(*) AS veces
FROM pedidos_global
GROUP BY pedido_id
HAVING COUNT(*) > 1;


-- 4) COMPLETITUD VERTICAL DE CLIENTES
-- La vista reconstruida debe tener los mismos clientes que la tabla central.
SELECT
    'clientes_central' AS origen,
    COUNT(*) AS total_filas
FROM clientes_central

UNION ALL

SELECT
    'clientes_global' AS origen,
    COUNT(*) AS total_filas
FROM clientes_global;


-- 5) RECONSTRUCCION VERTICAL DE CLIENTES
-- Se reconstruye la tabla clientes uniendo datos publicos y datos de contacto.
SELECT *
FROM clientes_global
ORDER BY cliente_id;