# 🚀 Práctica 1 - Despliegue de OwnCloud con LDAP

Este documento detalla la implementación de **OwnCloud con autenticación LDAP** en dos escenarios diferentes.

---

# 📌 1. Datos del Alumno
- **Nombre:** Carlota
- **Práctica:** Practica 1 - Escenarios 1 y 2

---

# 🏢 Escenario 1: Pequeña Empresa con OwnCloud y Autenticación LDAP

## 🖥 2. Entorno de Desarrollo y Producción
El sistema ha sido desarrollado y probado en:
- **Sistema Operativo:** macOS Sonoma 14.5
- **Gestor de Contenedores:** Docker + Docker Compose
- **Servicios:** OwnCloud, MariaDB, Redis, OpenLDAP

---

## 🎯 3. Descripción y Objetivos
El objetivo de este escenario es implementar un sistema de almacenamiento en la nube con **autenticación LDAP** para una pequeña empresa.

### ✅ Requisitos
- Soportar hasta **150 usuarios**.
- Implementar **OwnCloud** con **MariaDB** y **Redis**.
- Autenticación centralizada con **LDAP**.
- Implementar **backups automáticos**.
- Garantizar **almacenamiento entre 100GB - 10TB**.

---

## ⚙️ 4. Servicios y Configuración
Los siguientes servicios se han desplegado con **Docker Compose**:

| Servicio   | Descripción                             |
|------------|-----------------------------------------|
| OwnCloud   | Plataforma de almacenamiento en la nube |
| MariaDB    | Base de datos para OwnCloud            |
| Redis      | Mejora de caché y sesiones             |
| OpenLDAP   | Autenticación de usuarios              |

### 📜 Despliegue con Docker Compose
Para iniciar los servicios:
```sh
docker-compose up -d
```

Para verificar que está corriendo:
```sh
docker ps
```

Para acceder a OwnCloud en el navegador:
```sh
http://localhost:8080
```

👤 Credenciales del usuario en OwnCloud
Usuario: carlota
Contraseña: carlota

### ✅ 5. Conclusiones
- Implementación de OwnCloud con autenticación LDAP.
- Configuración de MariaDB y Redis para optimizar el rendimiento.
- Establecimiento de un sistema de backups automatizados.
- Configuración almacenamiento persistente.

### 📚 7. Referencias
- (OwnCloud Documentation)[https://doc.owncloud.com]
- (OpenLDAP Docker)[https://github.com/osixia/docker-openldap]
- (MariaDB Docker)[https://hub.docker.com/_/mariadb]
- (Redis Docker)[https://hub.docker.com/_/redis]


# 🏢 Escenario 2: Pequeña Empresa con OwnCloud y Autenticación LDAP