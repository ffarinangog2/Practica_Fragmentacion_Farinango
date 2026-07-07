DROP TABLE IF EXISTS pedidos CASCADE;

CREATE TABLE pedidos (
    pedido_id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    fecha DATE NOT NULL,
    monto NUMERIC(8,2) NOT NULL,
    sede VARCHAR(20) NOT NULL
);

INSERT INTO pedidos (pedido_id, cliente_id, producto_id, fecha, monto, sede)
SELECT pedido_id, cliente_id, producto_id, fecha, monto, sede
FROM (
    VALUES
    (1, 1, 1, DATE '2026-03-01', 0.75, 'Campus'),
    (2, 2, 3, DATE '2026-03-01', 2.50, 'Babahoyo'),
    (3, 3, 2, DATE '2026-03-02', 1.00, 'Campus'),
    (4, 4, 4, DATE '2026-03-02', 1.25, 'Ventanas'),
    (5, 5, 5, DATE '2026-03-03', 1.00, 'Ventanas'),
    (6, 6, 1, DATE '2026-03-03', 0.75, 'Babahoyo'),
    (7, 1, 3, DATE '2026-03-04', 2.50, 'Campus'),
    (8, 2, 2, DATE '2026-03-04', 1.00, 'Babahoyo')
) AS datos(pedido_id, cliente_id, producto_id, fecha, monto, sede)
WHERE sede = :'SEDE';