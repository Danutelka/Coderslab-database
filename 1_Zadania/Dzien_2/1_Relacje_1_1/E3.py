from flask import Flask
from psycopg2 import connect, OperationalError
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from flask import request

app = Flask(__name__)
@app.route("/", methods = ['POST', 'GET'])
def hello():
    username = "postgres"
    passwd = "coderslab"
    hostname = "127.0.0.1"  # lub "localhost"
    db_name = "cinemas_db2"
    cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
    cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = cnx.cursor()

    if request.method == "GET":
        sql = "SELECT * FROM seans JOIN cinemas ON seans.cinema_id=cinemas.id JOIN movies ON seans.movie_id=movies.id;"
        cursor.execute(sql)
        html = '<form action="/" method="post">'
        html += '<select name="seans">'
        for seans in cursor:
            html += '<option value="{}">{} w kinie: {}</option>' .format(seans[0], seans[7], seans[4])
            html += '</select>'
            html += '<select name="method">'
            html += '<option>gotowka</option>'
            html += '<option>karta</option>'
            html += '<option>przelew</option>'
            html += '<option>brak</option>'
            html += '<input type="submit" value="kup bilet!"/>'
            html += '</form>'
            return html

    if request.method == "POST":
        seans = request.form['seans']
        metody = request.form['method']
        sql ="INSERT INTO bilety (seans_id) VALUES({}) RETURNING id;" .format(seans)
        cursor.execute(sql)
        last_id = cursor.fetchone()[0]
        sql ="INSERT INTO platnosc (ticket_id, method) VALUES({},{});" .format(last_id, method)
        cursor.execute(sql)
        return "Kupiles bilet"

@app.route("/bilety", methods = ['POST', 'GET'])
def tickets():
    username = "postgres"
    passwd = "coderslab"
    hostname = "127.0.0.1"  # lub "localhost"
    db_name = "cinemas_db2"
    cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
    cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = cnx.cursor()

    if request.method == "GET": 
        html = '<form action="/bilety" method="post">'
        html += '<select name="method">'
        html += '<option>gotowka</option>'
        html += '<option>karta</option>'
        html += '<option>przelew</option>'
        html += '<option>brak</option>'
        html += '<input type="submit" value="kup bilet!"/>'
        html += '</form>'
        return html

    if request.method == "POST":
        method = request.form['method']
        html = '<ul>'
        sql="SELECT * FROM bilety JOIN platnosc ON bilety.id = platnosc.bilety_id WHERE method='{}';".format(method)
        cursor.execute(sql)
        for c in cursor:
            html += "<li> Bilet nr {}, metoda płatności: {}</li>" .format(c[0], c[4])
        html += '</ul>'
        return html

if __name__=="__main__":
   app.run(debug=True)