from flask import Flask, jsonify, request
from datetime import datetime
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
#cors = CORS(app, resources={r"/api/*": {"origins": "*"}})
app.config['JSON_SORT_KEYS'] = False #unordered json object

import mysql.connector
import json

mydb = mysql.connector.connect(
  host="localhost", 
  user="root",
  passwd="",
  database="projectdb"
)

print(" * SERVER IS STARTING........")

###FUNCTIONS###
def SQLqueryDrink(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {}
    for result in myresult:
        content = {
            'drink_id': result[0], 
            'name': result[1], 
            'price': result[2], 
            'alcohol': result[3], 
            'size': result[4], 
            'calorie': result[5], 
            'picture': result[6], 
            'description': result[7], 
            'type_id': result[8]
        }
        payload.append(content)
        content = {}
    return payload

def SQLqueryFood(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {}
    for result in myresult:
        content = {
            'food_id': result[0], 
            'name': result[1], 
            'price': result[2], 
            'size': result[3], 
            'calorie': result[4], 
            'picture': result[5], 
            'description': result[6]
            }
        payload.append(content)
        content = {}
    return payload

def SQLqueryOrder(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {}
    for result in myresult:
        content = {
            'order_id': result[0], 
            'start': result[1], 
            'end': result[2], 
            'table_id': result[3]
            }
        payload.append(content)
        content = {}
    return payload

def SQLqueryLastID():
    mycursor = mydb.cursor()
    myresult = mycursor.execute("SELECT LAST_INSERT_ID()")
    myresult = mycursor.fetchall()
    for result in myresult:
        last = result[0]
    return str(last)

def SQLinsert(query, values):
    mycursor = mydb.cursor()
    mycursor.execute(query, values)
    mydb.commit()
    return mycursor.rowcount

###APP ROUTE###
@app.route('/') 
def hello_world():
    return "<h1>WELCOME TO WEBWAITER SERVER</h1>"#jsonify({'in' : 'progress'})

@app.route('/drinks')
def allDrinks():
    return jsonify(SQLqueryDrink("SELECT * FROM drink"))

@app.route('/cocktails')
def allCocktails():
    return jsonify(SQLqueryDrink("SELECT * FROM drink WHERE DrinkType_id = 1"))

@app.route('/beers')
def allBeers():
    return jsonify(SQLqueryDrink("SELECT * FROM drink WHERE DrinkType_id = 3"))

@app.route('/foods')
def allFoods():
    return jsonify(SQLqueryFood("SELECT * FROM food"))

@app.route('/ordersWithoutEnd')
def allOrdersWithoutEnd():
    return jsonify(SQLqueryOrder("SELECT * FROM `order` WHERE Order_end IS NULL"))

@app.route('/addorder/<int:table>', methods=['POST']) #GET requests will be blocked
def addOrder(table):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")  #current time in the requested format
    query = "INSERT INTO `order` (Order_start, Table_id) VALUES (%s,%s)"
    value = (date_time, table)
    rowcount = SQLinsert(query,value)
    Order_id = SQLqueryLastID()
    print(str(rowcount) + " ORDER was inserted. Order ID: " + Order_id)
    for detail in data:
        total_price = detail['quantity'] * detail['price']
        query = '''INSERT INTO `orderdrink` (   Order_id, 
                                                Drink_id,
                                                Drink_quantity,
                                                Drink_total_price,
                                                Table_id,
                                                DrinkType_id    ) VALUES (%s,%s,%s,%s,%s,%s)'''
        value = (Order_id, detail['drink_id'],detail['quantity'],detail['totalPrice'],table,detail['type_id'])
        rowcount = SQLinsert (query,value)
        OrderDrink_id = SQLqueryLastID()
        print(str(rowcount) + " ORDERDRINK was inserted. OrderDrink ID: " + OrderDrink_id)
    return "Tabele: " + str(table) + " ID order: " + Order_id + " Data: " + str(data)

if __name__ == '__main__':
    app.run(debug=True)