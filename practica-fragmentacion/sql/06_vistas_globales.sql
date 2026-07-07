CREATE EXTENSION IF NOT EXISTS postgres_fdw;

DROP VIEW IF EXISTS pedidos_global CASCADE;
DROP VIEW IF EXISTS clientes_global CASCADE;

DROP FOREIGN TABLE IF EXISTS pedidos_babahoyo CASCADE;
DROP FOREIGN TABLE IF EXISTS pedidos_ventanas CASCADE;
DROP FOREIGN TABLE IF EXISTS clientes_contacto_remota CASCADE;

DROP SERVER IF EXISTS srv_babahoyo CASCADE;
DROP SERVER IF EXISTS srv_ventanas CASCADE;

CREATE SERVER srv_babahoyo
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'pg-babahoyo', dbname 'cafeteria', port '5432');

CREATE SERVER srv_ventanas
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'pg-ventanas', dbname 'cafeteria', port '5432');

CREATE USER MAPPING FOR admin
SERVER srv_babahoyo
OPTIONS (user 'admin', password 'admin123');

CREATE USER MAPPING FOR admin
SERVER srv_ventanas
OPTIONS (user 'admin', password 'admin123');

CREATE FOREIGN TABLE pedidos_babahoyo (
    pedido_id INTEGER,
    cliente_id INTEGER,
    producto_id INTEGER,
    fecha DATE,
    monto NUMERIC(8,2),
    sede VARCHAR(20)
)
SERVER srv_babahoyo
OPTIONS (table_name 'pedidos');

CREATE FOREIGN TABLE pedidos_ventanas (
    pedido_id INTEGER,
    cliente_id INTEGER,
    producto_id INTEGER,
    fecha DATE,
    monto NUMERIC(8,2),
    sede VARCHAR(20)
)
SERVER srv_ventanas
OPTIONS (table_name 'pedidos');

CREATE FOREIGN TABLE clientes_contacto_remota (
    cliente_id INTEGER,
    email VARCHAR(120),
    telefono VARCHAR(20)
)
SERVER srv_babahoyo
OPTIONS (table_name 'clientes_contacto');

CREATE VIEW pedidos_global AS
SELECT * FROM pedidos
UNION ALL
SELECT * FROM pedidos_babahoyo
UNION ALL
SELECT * FROM pedidos_ventanas;

CREATE VIEW clientes_global AS
SELECT
    p.cliente_id,
    p.nombre,
    p.ciudad,
    c.email,
    c.telefono
FROM clientes_publicos p
         JOIN clientes_contacto_remota c
              ON p.cliente_id = c.cliente_id;