# Práctica de Fragmentación de Base de Datos Distribuida

## Asignatura

Aplicaciones Distribuidas - ISR-701  
Universidad Técnica Estatal de Quevedo  
Carrera de Ingeniería de Software  

## Tema

Diseño y fragmentación de una base de datos distribuida usando PostgreSQL en contenedores Docker.

## Escenario

La práctica utiliza el caso de una cafetería universitaria con tres sedes:

- Campus
- Babahoyo
- Ventanas

Cada sede se representa como un nodo PostgreSQL independiente ejecutado en Docker.

## Tecnologías utilizadas

- Docker Desktop
- Docker Compose
- PostgreSQL 16 Alpine
- IntelliJ IDEA
- PowerShell

## Estructura del proyecto

```text
practica-fragmentacion/
│
├── docker-compose.yml
├── README.md
└── sql/
    ├── 01_esquema_central.sql
    ├── 02_datos.sql
    ├── 03_fragmentacion_horizontal.sql
    ├── 04_fragmentacion_vertical.sql
    ├── 05_fragmentacion_mixta.sql
    ├── 06_vistas_globales.sql
    └── 07_verificacion.sql
