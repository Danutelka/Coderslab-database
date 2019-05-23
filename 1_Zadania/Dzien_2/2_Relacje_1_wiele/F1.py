query_1 = "CREATE TABLE Options(id serial NOT NULL,product_id int NOT NULL,description varchar(255),PRIMARY KEY(id),FOREIGN KEY(product_id),REFERENCES product(id));

# pomyłka w nazwie: zamiast Opinions jest Options