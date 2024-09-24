
# PayMyBuddy - Financial Transaction Application

This repository contains the *PayMyBuddy* application, which allows users to manage financial transactions. It includes a Spring Boot backend and MySQL database.

---

## Objectives

This POC demonstrates the deployment of the *PayMyBuddy* app using Docker containers, with a focus on:

- Improving deployment processes
- Versioning infrastructure releases
- Implementing best practices for Docker
- Using Infrastructure as Code

### Key Themes:

- Dockerization of the backend and database
- Orchestration with Docker Compose
- Securing the deployment process
- Deploying and managing Docker images via Docker Registry

---

## Context

*PayMyBuddy* is an application for managing financial transactions between friends. The current infrastructure is tightly coupled and manually deployed, resulting in inefficiencies. We aim to improve scalability and streamline the deployment process using Docker and container orchestration.

---

## Infrastructure

The infrastructure will run on a Docker-enabled server with **Ubuntu 20.04**. This proof-of-concept (POC) includes containerizing the Spring Boot backend and MySQL database and automating deployment using Docker Compose.

### Components:

- **Backend (Spring Boot):** Manages user data and transactions
- **Database (MySQL):** Stores users, transactions, and account details
- **Orchestration:** Uses Docker Compose to manage the entire application stack

---

## Application

*PayMyBuddy* is divided into two main services:

1. **Backend Service (Spring Boot):**
   - Exposes an API to handle transactions and user interactions
   - Connects to a MySQL database for persistent storage

2. **Database Service (MySQL):**
   - Stores user and transaction data
   - Exposed on port 3306 for the backend to connect

### Build and Test (7 Points)

You will build and deploy the backend and MySQL database in Docker containers.

#### Database Initialization
The database schema is initialized using the initdb directory, which contains SQL scripts to set up the required tables and initial data. These scripts are automatically executed when the MySQL container starts.

#### Extra Challenges (Optional)
Secure Sensitive Information: Use Docker secrets or .env files to securely store sensitive information like database credentials.

User Authentication: Add user authentication to the backend to restrict access to the API and transactions.

1. **Backend Dockerfile:**
   - Base image: `amazoncorretto:17-alpine`
   - Copy backend JAR file and expose port 8080
   - CMD: Run the backend service
   
2. **Database Setup:**
   - Use MySQL as a Docker service, mounting the data to a persistent volume
   - Expose port 3306

### Orchestration with Docker Compose (5 Points)

The `docker-compose.yml` will deploy both services:
- **paymybuddy-backend:** Runs the Spring Boot application.
- **paymybuddy-db:** MySQL database to handle user data and transactions.

Key features:
- Services depend on each other for smooth orchestration
- Volumes for persistent storage
- Environment variables for secure configuration

---

## Docker Registry (4 Points)

You need to push your built images to a private Docker registry and deploy the images using Docker Compose.

### Steps:
1. Build the images for both backend and MySQL.
2. Deploy a private Docker registry.
3. Push your images to the registry and use them in `docker-compose.yml`.

---

## Delivery (4 Points)

For your delivery, provide the following in your repository:

- **README** with screenshots and explanations.
- **Dockerfile** and **docker-compose.yml**.
- **Screenshots** showing the application running.
  
Your delivery will be evaluated based on:
- Quality of explanations and screenshots
- Repository structure and clarity

**Good luck!**

([![Good luck](image-1.png)](https://www.bing.com/images/search?view=detailV2&ccid=LBQ0rPO3&id=6C7F5370183F1F754D03C931B582C73B498117EF&thid=OIP.LBQ0rPO30ToitP9y8HAaBwHaHa&mediaurl=https%3a%2f%2fi.pinimg.com%2foriginals%2f24%2f7c%2fd4%2f247cd417885129ae80ee12675ae0b839.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.2c1434acf3b7d13a22b4ff72f0701a07%3frik%3d7xeBSTvHgrUxyQ%26pid%3dImgRaw%26r%3d0&exph=800&expw=800&q=image+de+good+luck&simid=608038396394878487&FORM=IRPRST&ck=39FB4E1C9ED422F64B4A396A24E8D708&selectedIndex=23&itb=0))

