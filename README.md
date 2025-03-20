# 🚀 Práctica 1 - Despliegue de OwnCloud con LDAP

Este documento detalla la implementación de **OwnCloud con autenticación LDAP** en dos escenarios diferentes.

---

# 📌 1. Datos del Alumno
- **Nombre:** Carlota
- **Práctica:** Practica 1 - Escenarios 1 y 2

---

# 🏢 Escenario 1: Pequeña Empresa con OwnCloud y Autenticación LDAP
## 🎯 1. Descripción y Objetivos

Este escenario simula la implementación de un sistema de almacenamiento en la nube con autenticación centralizada mediante LDAP para una pequeña empresa o departamento.

El objetivo de este escenario es:
- Desplegar un sistema de almacenamiento en la nube seguro y accesible.
- Garantizar que los usuarios puedan autenticarse utilizando LDAP.
- Implementar una solución escalable con MariaDB y Redis para mejorar el rendimiento.
- Configurar un sistema de backups automatizados para garantizar la seguridad de los datos.
- Asegurar un almacenamiento de 100GB a 10TB según las necesidades de la empresa.

---

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
```
Usuario: carlota
Contraseña: carlota
```

---

## ✅ 5. Conclusiones
- Implementación de OwnCloud con autenticación LDAP.
- Configuración de MariaDB y Redis para optimizar el rendimiento.
- Establecimiento de un sistema de backups automatizados.
- Configuración almacenamiento persistente.

---

## 📚 6. Referencias
- (OwnCloud Documentation)[https://doc.owncloud.com]
- (OpenLDAP Docker)[https://github.com/osixia/docker-openldap]
- (MariaDB Docker)[https://hub.docker.com/_/mariadb]
- (Redis Docker)[https://hub.docker.com/_/redis]


---

# 🏢 Escenario 2: Empresa Mediana con OwnCloud y Alta Disponibilidad

## 🎯 1. Descripción y Objetivos
El objetivo de este escenario es implementar un sistema de almacenamiento en la nube para una empresa de tamaño mediano, con un enfoque en **alta disponibilidad, redundancia y escalabilidad**.

### ✅ Requisitos
- Soportar entre **150 y 1,000 usuarios**.
- Implementar **OwnCloud** con múltiples servidores de aplicación.
- Implementar **MariaDB con replicación** para garantizar la disponibilidad de la base de datos.
- Autenticación centralizada con **LDAP**.
- Implementar **balanceo de carga con HAProxy**.
- Uso de **Redis** para optimización de caché.
- Garantizar **almacenamiento de hasta 200TB**.
- Implementar **tolerancia a fallos** y garantizar continuidad del servicio sin interrupciones.

---

## ⚙️ 2. Infraestructura y Configuración
Este escenario implementa un sistema más robusto con los siguientes servicios desplegados en **Docker Compose**:

| Servicio           | Descripción                                      |
|--------------------|--------------------------------------------------|
| HAProxy           | Balanceador de carga para distribuir tráfico entre los servidores de OwnCloud |
| OwnCloud (x2)     | Dos instancias de OwnCloud para redundancia y alta disponibilidad |
| MariaDB (Maestro) | Base de datos principal de OwnCloud              |
| MariaDB (Esclavo) | Réplica de la base de datos para failover         |
| Redis             | Caché para mejorar el rendimiento                 |
| OpenLDAP          | Autenticación centralizada de usuarios            |

### 📜 Despliegue con Docker Compose
Para iniciar los servicios:
```sh
docker-compose up -d
```

Para verificar que están corriendo:
```sh
docker ps
```

Para acceder a OwnCloud a través de HAProxy:
```sh
http://localhost
```

Para acceder a las estadísticas de HAProxy:
```sh
http://localhost:5404/stats
```
👤 Credenciales de acceso:
```
Usuario: admin
Contraseña: adminpassword
```

---

## 🔄 3. Pruebas de Tolerancia a Fallos
Para garantizar la continuidad del servicio, se realizaron las siguientes pruebas:

### 📌 Prueba 1: Balanceo de Carga
1. Acceder a OwnCloud desde `http://localhost`.
2. Revisar que el tráfico se distribuye entre `owncloud1` y `owncloud2`.
3. Comprobar las estadísticas en `http://localhost:443/stats`.

### 📌 Prueba 2: Fallo de un Servidor OwnCloud
1. Apagar `owncloud1`:
   ```sh
   docker stop owncloud1
   ```
2. Verificar que `http://localhost` sigue funcionando con `owncloud2`.
3. Reiniciar `owncloud1`:
   ```sh
   docker start owncloud1
   ```

---

## ✅ 4. Conclusiones
- Implementación de **OwnCloud escalable y redundante**.
- Uso de **HAProxy** para distribuir tráfico entre servidores.
- Configuración de **MariaDB con replicación** para garantizar disponibilidad.
- Uso de **Redis** para mejorar rendimiento en caché.
- Pruebas de **tolerancia a fallos exitosas**, garantizando continuidad del servicio.

---

## 📚 5. Referencias
- [OwnCloud Documentation](https://doc.owncloud.com)
- [HAProxy Configuration](https://www.haproxy.com/documentation)
- [MariaDB Replication](https://mariadb.com/kb/en/replication/)
- [OpenLDAP Docker](https://github.com/osixia/docker-openldap)

## ⚙️ 6. Implementación con Kubernetes

### 📜 Despliegue con Kubernetes
Para desplegar los servicios en Kubernetes:
```sh
kubectl apply -f k8s/mariadb-deployment.yaml
kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/ldap-deployment.yaml
kubectl apply -f k8s/owncloud-deployment.yaml
```

Para verificar los pods:
```sh
kubectl get pods
```

Para acceder a OwnCloud en un clúster local (Minikube):
```sh
minikube service owncloud-service --url
```
