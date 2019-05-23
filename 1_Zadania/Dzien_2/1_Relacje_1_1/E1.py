query_1 = "CREATE (TABLE userAdress (id serial NOT NULL, user_id int NOT NULL UNIQUE, street varchar(255), city varchar(255), house_nr varchar(255), PRIMARY KEY(id),FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE);"
query_2 = "INSERT INTO users(user_id, user_name, user_email) VALUES (1, 'Anna', 'anna@mail.pl');"
query_3 = "INSERT INTO useradress(user_id, street, city, house_nr) VALUES (1, 'Dluga', 'Krakow', 2);"
