# JasonShop

JasonShop is a full-stack **e-commerce** project built with **Spring Boot (Java)** on the backend and **Angular (TypeScript)** on the frontend.

The repository is split into two main parts:

- **Backend**: `jasonapp_backend_java/` — Spring Boot REST API
- **Frontend**: `jasonapp_frontend/` — Angular UI

---
<img width="1920" height="2288" alt="screencapture-localhost-4200-2026-03-31-22_15_13" src="https://github.com/user-attachments/assets/6d788b65-1736-4f28-b38a-0b1a23fdfeb8" />

## Features

### Authentication & Authorization
- User registration (email + password)
- Login with email/password (JWT)
- Social login with **Google / Facebook** (OAuth2)
- Role-based access control: `ROLE_USER` and `ROLE_ADMIN`
- Refresh token, logout
  
<img width="1920" height="1273" alt="screencapture-localhost-4200-login-2026-03-31-22_15_55" src="https://github.com/user-attachments/assets/9386c2aa-62dd-41a8-9a83-f042c53c513d" />



### Products
- Browse product listings (with pagination, search, and category filtering)
- View product details
- **[Admin]** Create / update / delete products
- **[Admin]** Upload product images
  
<img width="1910" height="946" alt="image" src="https://github.com/user-attachments/assets/dd476857-901d-4290-b719-7be816865ac7" />


### Categories
- Browse category list
- **[Admin]** Create / update / delete categories
<img width="1901" height="944" alt="image" src="https://github.com/user-attachments/assets/22df1c9d-a63f-4864-ac7b-3382ae7d8a1a" />


### Shopping Cart
- Add products to cart
- Update item quantities
- Remove items from cart
- View cart subtotal
<img width="1920" height="1284" alt="screencapture-localhost-4200-products-2-2026-03-31-22_48_17" src="https://github.com/user-attachments/assets/c8e17fd3-6989-4cef-875c-12be41663aff" />


### Orders & Payments
- Place orders from cart
- Pay via **VNPay sandbox** (requires a separate sandbox account registration)
- Cash on delivery (COD)
- View order history (user-side)
- **[Admin]** View and update status of all orders
<img width="1920" height="1309" alt="screencapture-localhost-4200-orders-2026-03-31-22_19_43" src="https://github.com/user-attachments/assets/f4219bd1-6214-4863-a55f-dd5776d7a239" />

### Admin Dashboard
- Overview dashboard
- User management (list, lock/unlock accounts)
- Product & category management (CRUD)
- Order management (view, update status)
<img width="1918" height="913" alt="image" src="https://github.com/user-attachments/assets/3d702427-578c-41c2-a6c3-d68b421264eb" />


---

## System Architecture

<img width="2282" height="904" alt="Kiến trúc hệ thống ShopApp drawio" src="https://github.com/user-attachments/assets/19e97a98-f423-4747-ae2d-cac526c3bb99" />

---
## Database
<img width="1098" height="591" alt="image" src="https://github.com/user-attachments/assets/f0cb1a41-1433-4c31-a6cb-d4aa18d571ab" />

## Tech Stack

### Backend (`jasonapp_backend_java`)

| Technology | Description |
|---|---|
| **Java 21** | Primary language |
| **Spring Boot 3.3.x** | Backend framework |
| **Spring Web** | REST API |
| **Spring Data JPA** | ORM — MySQL integration |
| **Spring Security + JWT** | Authentication & authorization |
| **OAuth2 (Google/Facebook)** | Third-party login |
| **Redis** | Caching (default: `use-redis-cache: false`) |
| **Kafka** | Message broker (producer/consumer demo included) |
| **Flyway** | Database migration |
| **Swagger UI (springdoc-openapi)** | Auto-generated API documentation |
| **VNPay sandbox** | Payment gateway (configured in `application.yml`) |

Backend runs at:

- API base URL: `http://localhost:8088`
- API prefix: `/api/v1` (see `api.prefix` in `application.yml`)
- Swagger UI: `http://localhost:8088/swagger-ui.html`

### Frontend (`jasonapp_frontend`)

| Technology | Description |
|---|---|
| **Angular** | Frontend framework (see `package.json` for version) |

Frontend runs at: `http://localhost:4200`

---

## Running Locally

### 1) Prerequisites

- **Docker Desktop** — to run Kafka/ZooKeeper via docker-compose
- **Java 21**
- **Maven** (or run Spring Boot directly from IntelliJ)
- **Node.js** (LTS recommended)
- **pnpm**

---

### 2) Start Kafka + ZooKeeper with Docker

Config file: `jasonapp_backend_java/kafka-deployment.yaml`

Open a terminal and navigate to the backend directory:

```bash
cd jasonapp_backend_java
```

**(Optional) Remove old containers / clean up:**

```bash
docker rm -f zookeeper-01 zookeeper-02 zookeeper-03 kafka-broker-01
docker-compose -f ./kafka-deployment.yaml down -v
```

**Start ZooKeeper (3 nodes):**

```bash
docker-compose -f ./kafka-deployment.yaml up -d zookeeper-01
docker-compose -f ./kafka-deployment.yaml up -d zookeeper-02
docker-compose -f ./kafka-deployment.yaml up -d zookeeper-03
```

Wait about **10 seconds**, then start the Kafka broker:

```bash
docker-compose -f ./kafka-deployment.yaml up -d kafka-broker-01
```

Verify containers are running:

```bash
docker ps
```

> The Kafka broker exposes port `9092` on the host machine (see `kafka-deployment.yaml` for details).
