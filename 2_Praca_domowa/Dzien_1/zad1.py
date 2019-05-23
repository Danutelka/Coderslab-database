
from flask import Flask, request
from psycopg2 import connect, OperationalError
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


app = Flask (__name__)
@app.route("/dod/film",methods=['GET', 'POST'])
def dodawanie_film():
    if request.method == "GET":
        return open('zad_1.html').read()
    if request.method == "POST":
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1" #localhost
        db_name= "cinemas_db"
        name = request.form ['name']
        desc = request.form ['desc']
        rating = request.form ['rating']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "INSERT INTO movie (name, description, rating) VALUES ('{}','{}','{}');".format(name, desc, rating)
        cursor.execute(sql)
        cnx.commit()
        cursor.close()
        cnx.close()
        return "Film dodany"
@app.route("/dod/bilet",methods=['GET', 'POST'])
def dodawanie_bilet():
    if request.method == "GET":
        return open('zad1_2.html').read()
    if request.method == "POST":
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1" #localhost
        db_name= "cinemas_db"
        quantity = request.form ['quantity']
        price = request.form ['price']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "INSERT INTO ticket (quantity, price) VALUES ('{}', '{}');".format(quantity, price)
        cursor.execute(sql)
        cnx.commit()
        cursor.close()
        cnx.close()
        return "Bilet dodany"
@app.route("/dod/kino",methods=['GET', 'POST'])
def dodawanie_kino():
    if request.method == "GET":
        return open('zad1_3.html').read()
    if request.method == "POST":
       username = "postgres"
       passwd = "coderslab"
       hostname = "127.0.0.1" #localhost
       db_name= "cinemas_db"
       name = request.form ['name']
       adress = request.form ['adress']
       cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
       cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
       cursor = cnx.cursor()
       sql = "INSERT INTO cinema (name, adress) VALUES ('{}', '{}');".format(name, adress)
       cursor.execute(sql)
       cnx.commit()
       cursor.close()
       cnx.close()
       return "Kino dodane"
@app.route("/dod/kasa",methods=['GET', 'POST'])
def dodawanie_platnosc():
    if request.method == "GET":
        return open('zad1_4.html').read()
    if request.method == "POST":
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1" #localhost
        db_name= "cinemas_db"
        type = request.form ['type']
        date = request.form ['date']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "INSERT INTO payment(type, date) VALUES ('{}', '{}');".format(type, date)
        cursor.execute(sql)
        cnx.commit()
        cursor.close()
        cnx.close()
        return "Płatność dodana"
@app.route("/del/<int:id>/<table>")
def usuwanie(id, table):
   username = "postgres"
   passwd = "coderslab"
   hostname = "127.0.0.1"  # lub "localhost"
   db_name = "cinemas_db"
   cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
   cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
   cursor = cnx.cursor()
   sql = "DELETE FROM {} WHERE id = {};" .format(table, id)
   cursor.execute(sql)
   cursor.close()
   cnx.close()
   return "Usunięto: {} z tabelki: {}".format(id, table)
@app.route("/printing/<table>")
def allkina(table):
    username = "postgres"
    passwd = "coderslab"
    hostname = "127.0.0.1"  # lub "localhost"
    db_name = "cinemas_db"
    cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
    cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = cnx.cursor()
    sql = "SELECT * FROM {};" .format(table)
    cursor.execute(sql)
    cnx.commit()
    r=""
    for p in cursor:
        r += "{} {} {} {}<br/>" .format(p[0], p[1], p[2], p[3])
    cursor.close()
    cnx.close()
    return r  
@app.route("/print/kina", methods=['GET', 'POST'])
def wyswietl_kina():
    if request.method == "GET":
        return open('zad1_wkina.html').read()
    if request.method == "POST":        
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1"
        db_name = "cinemas_db"
        name = request.form ['name']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "SELECT * FROM cinema WHERE name LIKE '{}';" .format(name)
        cursor.execute(sql)
        cnx.commit()
        k=""
        for m in cursor:
            k += "{} {} {} {}<br/>" .format(m[0], m[1], m[2], m[3])
        cursor.close()
        cnx.close()
        return k
@app.route("/print/filmy", methods=['GET', 'POST'])
def wyswietl_film():
    if request.method == "GET":
        return open('zad1_wfilmt.html').read()
    if request.method == "POST":        
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1"
        db_name = "cinemas_db"
        name = request.form ['name']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "SELECT * FROM movie WHERE name LIKE '{}';" .format(name)
        cursor.execute(sql)
        cnx.commit()
        f=""
        for s in cursor:
            f += "{} {} {} {}<br/>" .format(s[0], s[1], s[2], s[3])
        cursor.close()
        cnx.close()
        return f
@app.route("/print/rating", methods=['GET', 'POST'])
def wyswietl_rating():
    if request.method == "GET":
        return open('zad_1rating.html').read()
    if request.method == "POST":        
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1"
        db_name = "cinemas_db"
        rating = request.form ['rating']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "SELECT * FROM movie WHERE rating = '{}';" .format(rating)
        cursor.execute(sql)
        cnx.commit()
        t=""
        for g in cursor:
            t += "{} {} {}</br>" .format(g[0], g[1], g[2], g[3])
        cursor.close()
        cnx.close()
        return t
@app.route("/print/daty", methods=['GET', 'POST'])
def wyswietl_zakres():
    if request.method == "GET":
        return open('zad1_zakres.html').read()
    if request.method == "POST":        
        username = "postgres"
        passwd = "coderslab"
        hostname = "127.0.0.1"
        db_name = "cinemas_db"
        date1 = request.form ['date1']
        date2 =request.form['date2']
        cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
        cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = cnx.cursor()
        sql = "SELECT * FROM payment BETWEEN date AND date = '{}''{}';" .format(date1, date2)
        cursor.execute(sql)
        cnx.commit()
        u=""
        for c in cursor:
            u += "{} {} {}</br>" .format(c[0], c[1], c[2], c[3])
        cursor.close()
        cnx.close()
        return u    
if __name__=="__main__":
    app.run(debug=True)
