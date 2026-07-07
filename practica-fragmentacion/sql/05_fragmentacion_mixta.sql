\if :PUB_QUEVEDO

DROP TABLE IF EXISTS clientes_pub_quevedo CASCADE;

CREATE TABLE clientes_pub_quevedo (
                                      cliente_id INTEGER PRIMARY KEY,
                                      nombre VARCHAR(80) NOT NULL,
                                      ciudad VARCHAR(40) NOT NULL
);

INSERT INTO clientes_pub_quevedo VALUES
                                     (1, 'Maria Alvarado', 'Quevedo'),
                                     (3, 'Ana Vera', 'Quevedo');

\endif


\if :CONTACTO_QUEVEDO

DROP TABLE IF EXISTS clientes_cont_quevedo CASCADE;

CREATE TABLE clientes_cont_quevedo (
                                       cliente_id INTEGER PRIMARY KEY,
                                       email VARCHAR(120) NOT NULL,
                                       telefono VARCHAR(20)
);

INSERT INTO clientes_cont_quevedo VALUES
                                      (1, 'maria@uteq.edu.ec', '0991111111'),
                                      (3, 'ana@uteq.edu.ec', '0993333333');

\endif


\if :PUB_BV

DROP TABLE IF EXISTS clientes_pub_bv CASCADE;

CREATE TABLE clientes_pub_bv (
                                 cliente_id INTEGER PRIMARY KEY,
                                 nombre VARCHAR(80) NOT NULL,
                                 ciudad VARCHAR(40) NOT NULL
);

INSERT INTO clientes_pub_bv VALUES
                                (2, 'Luis Cedeno', 'Babahoyo'),
                                (4, 'Jose Mendoza', 'Ventanas'),
                                (5, 'Carla Zambrano', 'Ventanas'),
                                (6, 'Pedro Suarez', 'Babahoyo');

\endif


\if :CONTACTO_BV

DROP TABLE IF EXISTS clientes_cont_bv CASCADE;

CREATE TABLE clientes_cont_bv (
                                  cliente_id INTEGER PRIMARY KEY,
                                  email VARCHAR(120) NOT NULL,
                                  telefono VARCHAR(20)
);

INSERT INTO clientes_cont_bv VALUES
                                 (2, 'luis@uteq.edu.ec', '0992222222'),
                                 (4, 'jose@uteq.edu.ec', '0994444444'),
                                 (5, 'carla@uteq.edu.ec', '0995555555'),
                                 (6, 'pedro@uteq.edu.ec', '0996666666');

\endif