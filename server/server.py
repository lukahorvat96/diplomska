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
            'order_start': result[1], 
            'order_end': result[2], 
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

def SQLqueryOrderProduct(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'product_id': result[0], 
            'order_id': result[1], 
            'product_total_price': result[2], 
            'product_quantity': result[3]
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
        #print(str(rowcount) + " ORDER was inserted. ID: " + str(Order_id))
        print("Tabele: " + str(table) + " ID order: " + Order_id + " Order Start: " + date_time)
    socketio.emit('checkDatabesOrders', broadcast=True)
    return Order_id

@app.route('/updateorder/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrder(orderID):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))
    #če je quantity enak orderqunatity #1 še ne obstaja v bazi; #2 je že v bazi - preveri!
    #SELECT * FROM productorder where productorder.Product_id = 4 AND productorder.Order_id=33
    result = SQLqueryOrder("SELECT * FROM `order` where Order_id=" + str(orderID))
    print(str(result))
    # if (result[0]['order_status'] != "Not served" ):
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = ("Order updated",orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("ORDER UPDATED")
    for detail in data:
        result = SQLqueryOrderProduct("SELECT * FROM productorder where productorder.Product_id =" + str(detail['drink_id']) + " AND productorder.Order_id=" + str(orderID))
        if len(result) == 0:
            print("DODAJAM V BAZO!")
            query = '''INSERT INTO `productorder` ( Product_id, 
                                                    Order_id,
                                                    Product_total_price,
                                                    Product_quantity ) VALUES (%s,%s,%s,%s)'''
            value = (detail['drink_id'],orderID,detail['totalPrice'],detail['quantity'])
            rowcount = SQLinsert (query,value)
            #print(str(rowcount) + " ORDER was inserted. ID: " + str(Order_id))
            print("ROW: "+ str(rowcount) + " DODANO V BAZO: " + str(orderID) + " PRODUCT ID: " + str(detail['drink_id']))
        else:
            if ((result[0]['product_quantity']) != detail['quantity'] ):
                query = "UPDATE productorder SET productorder.Product_total_price = %s, productorder.Product_quantity = %s WHERE Order_id = %s AND Product_id = %s"
                value = (detail['totalPrice'],detail['quantity'],orderID,detail['drink_id'])
                mycursor = mydb.cursor()
                mycursor = mydb.cursor()
                mycursor.execute(query,value)
                mydb.commit()
                print(mycursor.rowcount, "POSDOBLJENO V BAZI; PRODUCT ID: " + str(detail['drink_id']) + " NEW QUAN: "+ str(detail['quantity']))
        #select quantity za order in preverš ali je enak iz naročila, če ni popravi!!!   
        socketio.emit('checkDatabesOrders', broadcast=True)
    return ""
    # now = datetime.now()
    # date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")  #current time in the requested format
    # query = "INSERT INTO `order` (Order_start, Table_id, Order_status) VALUES (%s,%s,%s)"
    # value = (date_time, table, "Not served")
    # rowcount = SQLinsert(query,value)
    # Order_id = SQLqueryLastID()
    # print(str(rowcount) + " ORDER was inserted. Order ID: " + Order_id)
    # for detail in data:
    #     query = '''INSERT INTO `productorder` (     Product_id, 
    #                                                 Order_id,
    #                                                 Product_total_price,
    #                                                 Product_quantity ) VALUES (%s,%s,%s,%s)'''
    #     value = (detail['drink_id'],Order_id,detail['totalPrice'],detail['quantity'])
    #     rowcount = SQLinsert (query,value)
    #     #print(str(rowcount) + " ORDER was inserted. ID: " + str(Order_id))
    #     print("Tabele: " + str(table) + " ID order: " + Order_id + " Order Start: " + date_time)
    # socketio.emit('checkDatabesOrders', broadcast=True)
    # return Order_id

@app.route('/updateorderstatus/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrderStatus(orderID):
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = ("Served",orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("UPDATE ORDER STATUS: " + str(orderID)) 
    socketio.emit('checkDatabesOrders', broadcast=True)
    return ""

@app.route('/endorder/<int:orderID>', methods=['POST']) #GET requests will be blocked
def endOrder(orderID):
    query = "UPDATE `order` SET Order_status = %s, Order_end = %s WHERE Order_id = %s"
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")
    value = ("Finished",date_time,orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("ORDER END; ORDERID: " + str(orderID)) 
    socketio.emit('checkDatabesOrders', broadcast=True)
    return ""

    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))
if __name__ == '__main__':
    socketio.run(app)