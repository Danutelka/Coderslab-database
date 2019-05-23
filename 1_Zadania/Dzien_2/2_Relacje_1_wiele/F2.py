from flask import Flask, request
from psycopg2 import connect, OperationalError
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

app = Flask(__name__)
@app.route("/", methods = ["GET", "POST"])
def kup_bilet():
    username = "postgres"
    passwd = "coderslab"
    hostname = "127.0.0.1"  # lub "localhost"
    db_name = "cinemas_db2"
    cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
    cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = cnx.cursor()

 # jako default bedzie użyta metoda GET
 # metoda POST wskazana w formularzu w B4.tml
 # będzie użyta po kliknięciu wyślij

    if request.method == "GET":
        html = '<form action="/" method="POST">'
        html += '<select>'
        html += '<option value="1"> jeden </option>'
        html += '<option value="2"> dwa </option>'
        html += '<option value="3"> trzy </option>'
        html += '</select>'
        html += '<input type="submit"/>'
        html = '</form>'
        return html
    if request.method == "POST":
        return "Ok, dodne"

    cursor.execute(sql)
    cursor.close()
    cnx.close()
    return r

if __name__ == '__main__':
    app.run()