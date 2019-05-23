
from flask import Flask
from psycopg2 import connect, OperationalError
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from flask import request

app = Flask(__name__)
@app.route("/products", methods = ['POST', 'GET'])
def hello():
	username = "postgres"
	passwd = "root"
	hostname = "127.0.0.1"  # lub "localhost"
	db_name = "exercises_db"
	cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
	cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
	cursor = cnx.cursor()

	if request.method == "GET":
		html = ''
		sql = "SELECT * FROM product;"
		cursor.execute(sql)
		products = []
		for c in cursor:
			products.append(c)

		for p in products:
			html += "Produkt: {} </br>".format(p[1])
			sql = "SELECT * FROM orders JOIN product_orders ON orders.id = product_orders.order_id WHERE product_id = {};".format(p[0])
			cursor.execute(sql)
			html += '<ul>'
			for c in cursor:
			    html += '<li>{}</li>'.format(c[1])
			    html += '</ul>'
		        return html


@app.route("/orders", methods = ['POST', 'GET'])
def tickets():
	username = "postgres"
	passwd = "root"
	hostname = "127.0.0.1"  # lub "localhost"
	db_name = "exercises_db"
	cnx = connect(user=username, password=passwd, host=hostname, database=db_name)
	cnx.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
	cursor = cnx.cursor()

	if request.method == "GET":
		return html

if __name__ == "__main__":
    app.run(debug=True)