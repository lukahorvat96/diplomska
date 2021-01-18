from flask import Flask, jsonify, request
from datetime import datetime
from flask_cors import CORS
from flask_socketio import SocketIO, send, emit

app = Flask(__name__)
#app.config['SECRET_KEY'] = 'secret!'
app.debug = True
CORS(app)
socketio = SocketIO(app, cors_allowed_origins="*")
#cors = CORS(app, resources={r"/api/*": {"origins": "*"}})
app.config['JSON_SORT_KEYS'] = False #unordered json object

import mysql.connector
import json

mydb = mysql.connector.connect(
  host="localhost", 
  user="root",
  passwd="",
  database="newprojectdb"
)

print(" * SERVER IS STARTING........")


@socketio.on('message')
def handle_message(data):
    print('received message: ' + data)

@socketio.on('dodal_v_bazo')
def handle_my_custom_event(string):
    emit('my response', 'Check database!!!', broadcast=True)
    print('received string: ' + string)

@socketio.on('newOrderInDatabese')
def newOrderInDatabese():
    emit('checkDatabesOrders', broadcast=True)
    print('newOrderInDatabese')


@socketio.on('dodal_v_bazo_waiter')
def handle_my_custom_event_waiter(string):
    print('WAITER: ' + string)

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
            'size': result[3], 
            'calorie': result[4], 
            'picture': result[5], 
            'description': result[6], 
            'type_id': result[7]
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
            'table_id': result[3],
            'user_id': result[4],
            'order_status': result[5]
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

def SQLqueryOrderDrink(query):
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
            'size': result[3], 
            'calorie': result[4], 
            'picture': result[5], 
            'description': result[6], 
            'type_id': result[7],
            'totalPrice': result[10],
            'quantity':  result[11]
        }
        payload.append(content)
        content = {}
    return payload

###APP ROUTE###
@app.route('/') 
def hello_world():
    return "<h1>WELCOME TO WEBWAITER SERVER</h1>"#jsonify({'in' : 'progress'})

@app.route('/drinks')
def allDrinks():
    return jsonify(SQLqueryDrink("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink'"))

@app.route('/bottledbeer')
def allBeers():
    return jsonify(SQLqueryDrink("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=3"))

@app.route('/draughtbeer')
def allDraughtBeer():
    return jsonify(SQLqueryDrink("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=2"))

@app.route('/cider')
def allCider():
    return jsonify(SQLqueryDrink("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=1"))

@app.route('/ordersWithoutEnd')
def allOrdersWithoutEnd():
    return jsonify(SQLqueryOrder("SELECT * FROM `order` WHERE Order_end IS NULL"))

@app.route('/orders/<int:order>', methods=['GET']) #GET requests will be blocked
def getOrderById(order):
    return jsonify(SQLqueryOrderDrink("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id AND productorder.Order_id = "+str(order)))


@app.route('/addorder/<int:table>', methods=['POST']) #GET requests will be blocked
def addOrder(table):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")  #current time in the requested format
    query = "INSERT INTO `order` (Order_start, Table_id, Order_status) VALUES (%s,%s,%s)"
    value = (date_time, table, "Not served")
    rowcount = SQLinsert(query,value)
    Order_id = SQLqueryLastID()
    print(str(rowcount) + " ORDER was inserted. Order ID: " + Order_id)
    for detail in data:
        query = '''INSERT INTO `productorder` (     Product_id, 
                                                    Order_id,
                                                    Product_total_price,
                                                    Product_quantity ) VALUES (%s,%s,%s,%s)'''
        value = (detail['drink_id'],Order_id,detail['totalPrice'],detail['quantity'])
        rowcount = SQLinsert (query,value)
        print(str(rowcount) + " ORDER was inserted. ID: " + str(Order_id))
    return "Tabele: " + str(table) + " ID order: " + Order_id + " Data: " + str(data)

if __name__ == '__main__':
    socketio.run(app)