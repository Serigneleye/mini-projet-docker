
# The deployement of my application PayMyBuddy is working
![image](https://github.com/user-attachments/assets/2ad5b326-a3f6-4f97-b887-2a331403b783)

## How I proceed to make the deployment.

### Build and Test (7 Points)

First make a Simple dockerfile for the backend image that I called  **mybuddyimage** and the base image is  Base image: `amazoncorretto:17-alpine` .
Copy the paymybuddy.jar in the /app of the container which is my workdir.
![image](https://github.com/user-attachments/assets/4849f887-f06f-45b6-a8bc-dd11aef53a0e)

Built the image by Running :
**docker build -t paymybuddyimage .**


Couldn' test it yet because the database was not set.
Decide to use directly the mysql native image in my final docker compose and exposing 3306

### Orchestration with Docker Compose (5 Points)

The `docker-compose.yml`  deploy 2 services:
- **paymybuddy-backend:**  for the backend 
- **paymybuddy-db:**  for the database
  
  here is the service **paymybuddy-db:** of the mysql database using directly mysql:8.0 image
  ![image](https://github.com/user-attachments/assets/7645f901-ea5c-4ffd-bd1d-c8812cb08629)

  I used an **.env** to store database info for more security
  I mounted two elements in this service:
   The database data
     - db_data:/var/lib/mysql
   and the directory of initialization of the database
    - ./initdb:/docker-entrypoint-initdb.d
   In this following line we have the network sharing by services
    networks:
      - app_network
        
    And exposing the port 3306
  the **.env** file :
  MYSQL_ROOT_PASSWORD=admin
  MYSQL_DATABASE=db_paymybuddy
  MYSQL_USER=serigne
  MYSQL_PASSWORD=serigne

here is the service **paymybuddy-backend:** of the backend  using the image created before paymybuddyimage
![image](https://github.com/user-attachments/assets/2a9c7b81-ad07-45d6-955c-f3d0ffb0b499)

this following link allows to connect to the database: with paymybuddy-db the name of the service db.
SPRING_DATASOURCE_URL: jdbc:mysql://paymybuddy-db:3306/${MYSQL_DATABASE}

Use this following instruction to make sure the  database is initialized and healthy before the backeng starting.
    depends_on:
      - paymybuddy-db
After define the network and the volumes:
networks:
  app_network:
    driver: bridge

volumes:
  db_data:

## PLUS:
 **USE docker logs <name of container> to see state of my containers :** 
 for example the backend :
 ![image](https://github.com/user-attachments/assets/0ce4d869-4404-4db7-a40c-d828d8b8464c)

 **ADD MY SELF AS A USER FOR CONNECTING TO THE APPLICATION**
 ![image](https://github.com/user-attachments/assets/0ba77944-8075-486b-99ed-7f2ad2de976e)

 **THE FIRST PAGE OF THE APPLICATION**
 ![image](https://github.com/user-attachments/assets/a324aa2b-ecb8-4a8a-a0b6-a072d821003f)

 **RUNNING DOCKER COMPOSE**
![image](https://github.com/user-attachments/assets/45b207f3-4514-4497-bbd0-e58e893f9dc9)




## Docker Registry (4 Points)
**Build the images for both backend and MySQL**
![image](https://github.com/user-attachments/assets/be005a2d-78df-429b-956f-fd9f467240b8)

![image](https://github.com/user-attachments/assets/e24e46c6-1ca2-4652-8357-f313085d2d89)

**Deploy a private Docker registry**
![image](https://github.com/user-attachments/assets/203d5e96-dbdb-4852-ad74-43d8ccc146fc)

**Push your images to the registry and use them in `docker-compose.yml`.**
![image](https://github.com/user-attachments/assets/2f620e50-5c7b-42d1-8b98-16c0fc2483e4)

## Delivery (4 Points)

For your delivery

here is the **README** with screenshots and explanations.
the  **Dockerfile** and **docker-compose.yml** are in the folder.

  
