# PLAN DE SPRINTS – UNIRESERVE

## 1. Introducción

El desarrollo de UniReserve se organiza mediante una metodología de trabajo basada en sprints.

Cada sprint agrupa un conjunto de actividades relacionadas con el análisis, desarrollo, integración y validación del sistema.

El objetivo es avanzar de manera organizada hasta obtener un primer Producto Mínimo Viable (MVP).

---

## 2. Sprint 1 – Análisis y definición

### Objetivo

Definir las necesidades principales del sistema y establecer las historias de usuario que orientan el desarrollo de UniReserve.

### Actividades

* Definición del problema.
* Identificación de las necesidades del usuario.
* Definición de las historias de usuario.
* Definición de los criterios de aceptación.
* Organización inicial del proyecto.

### Resultado

Se definieron las seis historias de usuario principales del sistema.

---

## 3. Sprint 2 – Base de datos y backend

### Objetivo

Implementar la estructura necesaria para gestionar la información de UniReserve.

### Actividades

* Configuración de PostgreSQL.
* Configuración del backend con Spring Boot.
* Conexión entre Spring Boot y PostgreSQL mediante JDBC.
* Implementación de los endpoints necesarios.
* Ejecución de los servicios mediante Docker.

### Resultado

Se obtuvo un backend funcional conectado a PostgreSQL y preparado para atender las solicitudes de la aplicación móvil.

---

## 4. Sprint 3 – Aplicación móvil e integración

### Objetivo

Integrar la aplicación Flutter con el backend desarrollado.

### Actividades

* Desarrollo de las interfaces principales.
* Implementación del servicio de comunicación HTTP.
* Conexión de Flutter con el backend.
* Consulta de espacios desde la aplicación.
* Visualización de la información de los espacios.

### Resultado

La aplicación Flutter logró comunicarse correctamente con el backend y mostrar información obtenida desde la base de datos.

---

## 5. Sprint 4 – Reservas y validación

### Objetivo

Integrar las funcionalidades relacionadas con las reservas y realizar las pruebas finales del MVP.

### Actividades

* Implementación de la realización de reservas.
* Almacenamiento de las reservas.
* Consulta de las reservas realizadas.
* Cancelación de reservas.
* Visualización de la confirmación de una reserva.
* Pruebas de funcionamiento.
* Generación de la versión APK.

### Resultado

Se obtuvo un primer MVP funcional de UniReserve con las principales funcionalidades definidas en las historias de usuario.

---

## 6. Uso de las ramas de Git

Durante el desarrollo se utilizan tres ramas principales:

### Main

La rama `main` contiene la versión estable del proyecto.

Su objetivo es mantener una versión funcional que pueda ser considerada como entrega del MVP.

### Develop

La rama `develop` se utiliza para integrar los cambios realizados durante el desarrollo.

Es la rama destinada al trabajo y evolución del proyecto antes de pasar los cambios a una versión estable.

### QA

La rama `qa` se utiliza para realizar la validación y pruebas del proyecto antes de considerar los cambios como estables.

En esta rama se comprueba que las funcionalidades implementadas funcionen correctamente.

---

## 7. Flujo de trabajo

El flujo general utilizado es:

```text
Desarrollo
    ↓
develop
    ↓
qa
    ↓
Validación
    ↓
main
```

Este flujo permite mantener separadas las etapas de desarrollo, pruebas y versión estable.

---

## 8. Resultado de los sprints

Como resultado del trabajo realizado se cuenta con:

* Aplicación móvil desarrollada en Flutter.
* Backend desarrollado con Spring Boot.
* Base de datos PostgreSQL.
* Comunicación mediante HTTP/JSON.
* Servicios ejecutados mediante Docker.
* Funcionalidades principales de consulta y reserva de espacios.
* Primer MVP funcional.

