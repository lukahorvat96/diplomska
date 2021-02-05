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
def SQLqueryProduct(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {}
    for result in myresult:
        content = {
            'product_id': result[0], 
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
            'order_status': result[5],
            'cook_status': result[6],
            'payment': result[7]
            }
        payload.append(content)
        content = {}
    print(payload)
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

def SQLqueryAllOrdersProducts(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'product_id': result[0], 
            'name': result[1], 
            'price': result[2], 
            'size': result[3], 
            'calorie': result[4], 
            'picture': result[5], 
            'description': result[6], 
            'type_id': result[7],
            'order_id': result[9],
            'totalPrice': result[10],
            'quantity':  result[11]
        }
        payload.append(content)
        content = {}
    return payload

def SQLqueryAllProductByID(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'product_id': result[0], 
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

def SQLqueryUser(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'user_id': result[0], 
            'user_role': result[1], 
            'user_name': result[2], 
            'user_password': result[3]
        }
        payload.append(content)
        content = {}
    return payload

def SQLqueryOrderStatus(query):
    mycursor = mydb.cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'order_status': result[0], 
        }
        payload.append(content)
        content = {}
    return payload

###APP ROUTE###
@app.route('/') 
def hello_world():
    return "<h1>WELCOME TO WEBWAITER SERVER</h1>"#jsonify({'in' : 'progress'})

@app.route('/foods')
def allFoods():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food'"))

@app.route('/drinks')
def allDrinks():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink'"))

@app.route('/bottledbeer')
def allBeers():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=3"))

@app.route('/draughtbeer')
def allDraughtBeer():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=2"))

@app.route('/cider')
def allCider():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=1"))

@app.route('/wine')
def allWine():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=6"))

@app.route('/hotdrink')
def allHotDink():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=4"))

@app.route('/bottledbeverage')
def allBottledBeverages():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=12"))

@app.route('/naturalbeverage')
def allNaturalBeverages():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=13"))

@app.route('/gin')
def allGin():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=5"))

@app.route('/vodka')
def allVodka():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink' AND producttype.ProductType_id=9"))

@app.route('/starter')
def allStarter():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=15"))

@app.route('/soup')
def allSoup():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=16"))

@app.route('/salad')
def allSalad():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=17"))

@app.route('/pasta')
def allPasta():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=18"))

@app.route('/rissoto')
def allRissoto():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=19"))

@app.route('/pizza')
def allPizza():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=20"))

@app.route('/meat')
def allMeat():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=21"))

@app.route('/padthai')
def allPadThai():
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Food' AND producttype.ProductType_id=22"))

@app.route('/ordersWithoutEnd')
def allOrdersWithoutEnd():
    new = {}
    new['orders'] = SQLqueryOrder("SELECT * FROM `order` WHERE Order_end IS NULL")
    new['ordersfood'] = SQLqueryOrder("SELECT DISTINCT `order`.`Order_id`, `order`.`Order_start`, `order`.`Order_end`, `order`.`Table_id`, `order`.`User_id`, `order`.`Order_status`, `order`.`Cook_status`, `order`.`Payment` FROM `order`, productorder, product, producttype WHERE `order`.Order_id = productorder.Order_id AND productorder.Product_id = product.Product_id AND product.ProductType_id = producttype.ProductType_id AND producttype.ProductType_type = 'Food' AND `order`.`Order_end` IS NULL")
    return new

@app.route('/ordersFoodWithoutEnd')
def allOrdersFoodWithoutEnd():
    return jsonify(SQLqueryOrder("SELECT `order`.`Order_id`, `order`.`Order_start`, `order`.`Order_end`, `order`.`Table_id`, `order`.`User_id`, `order`.`Order_status`, `order`.`Cook_status`, `order`.`Payment` FROM `order`, productorder, product, producttype WHERE `order`.Order_id = productorder.Order_id AND productorder.Product_id = product.Product_id AND product.ProductType_id = producttype.ProductType_id AND producttype.ProductType_type = 'Food' AND `order`.`Order_end` IS NULL"))

@app.route('/order/<int:order>', methods=['GET']) #GET requests will be blocked
def getOrderStatus(order):
    return jsonify(SQLqueryOrderStatus("SELECT order_status FROM `order` WHERE order.order_id = "+str(order)))

@app.route('/orders/<int:order>', methods=['GET']) #GET requests will be blocked
def getOrderById(order):
    return jsonify(SQLqueryAllProductByID("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id AND productorder.Order_id = "+str(order)))

@app.route('/allordersproducts') #GET requests will be blocked
def getAllOrdersProducts():
    return jsonify(SQLqueryAllOrdersProducts("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id"))

@app.route('/addorder/<int:table>', methods=['POST']) #GET requests will be blocked
def addOrder(table):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")  #current time in the requested format
    query = "INSERT INTO `order` (Order_start, Table_id, Order_status) VALUES (%s,%s,%s)"
    value = (date_time, table, "PLACED")
    rowcount = SQLinsert(query,value)
    Order_id = SQLqueryLastID()
    print(str(rowcount) + " ORDER was inserted. Order ID: " + Order_id)
    for detail in data:
        query = '''INSERT INTO `productorder` (     Product_id, 
                                                    Order_id,
                                                    Product_total_price,
                                                    Product_quantity ) VALUES (%s,%s,%s,%s)'''
        value = (detail['product_id'],Order_id,detail['totalPrice'],detail['quantity'])
        rowcount = SQLinsert (query,value)
        #print(str(rowcount) + " ORDER was inserted. ID: " + str(Order_id))
        print("Tabele: " + str(table) + " ID order: " + Order_id + " Order Start: " + date_time)
    socketio.emit('checkDatabesOrders', broadcast=True)
    return Order_id


@app.route('/updateorderwaiter/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrderWaiter(orderID):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))
    #če je quantity enak orderqunatity #1 še ne obstaja v bazi; #2 je že v bazi - preveri!
    #SELECT * FROM productorder where productorder.Product_id = 4 AND productorder.Order_id=33
    result = SQLqueryOrder("SELECT * FROM `order` where Order_id=" + str(orderID))
    #print(str(result))
    # if (result[0]['order_status'] != "Not served" ):
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = ("CHANGED",orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("Lets begin....")
    productinorder = SQLqueryAllProductByID("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id AND productorder.Order_id = "+str(orderID))
    for product in productinorder:
        ordered = False
        for detail in data:
            if(product['product_id'] == detail['product_id']):
                ordered = True
                result = SQLqueryOrderProduct("SELECT * FROM productorder where productorder.Product_id =" + str(detail['product_id']) + " AND productorder.Order_id=" + str(orderID))
                if ((result[0]['product_quantity']) != detail['quantity'] ):
                    query = "UPDATE productorder SET productorder.Product_total_price = %s, productorder.Product_quantity = %s WHERE Order_id = %s AND Product_id = %s"
                    value = (detail['totalPrice'],detail['quantity'],orderID,detail['product_id'])
                    mycursor = mydb.cursor()
                    mycursor = mydb.cursor()
                    mycursor.execute(query,value)
                    mydb.commit()
                    print(mycursor.rowcount, "POSDOBLJENO V BAZI; PRODUCT ID: " + str(detail['product_id']) + " NEW QUAN: "+ str(detail['quantity']))
        if(ordered == False):
            query = "DELETE FROM productorder WHERE productorder.order_id = %s AND productorder.product_id = %s"
            value = (orderID, product['product_id'])
            mycursor = mydb.cursor()
            mycursor = mydb.cursor()
            mycursor.execute(query,value)
            mydb.commit()
            print(mycursor.rowcount, "DELETED FROM DB; PRODUCT ID: " + str(product['product_id']))
            # socketio.emit('checkDatabesOrders', broadcast=True)
    socketio.emit('orderChanged', orderID, broadcast=True)
    return ""

@app.route('/updateorder/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrder(orderID):
    data =  request.get_json(force=True) 
    result = SQLqueryOrder("SELECT * FROM `order` where Order_id=" + str(orderID))
    print(str(result))
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = ("UPDATED",orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("ORDER UPDATED")
    for detail in data:
        result = SQLqueryOrderProduct("SELECT * FROM productorder where productorder.Product_id =" + str(detail['product_id']) + " AND productorder.Order_id=" + str(orderID))
        if len(result) == 0:
            print("DODAJAM V BAZO!")
            query = '''INSERT INTO `productorder` ( Product_id, 
                                                    Order_id,
                                                    Product_total_price,
                                                    Product_quantity ) VALUES (%s,%s,%s,%s)'''
            value = (detail['product_id'],orderID,detail['totalPrice'],detail['quantity'])
            rowcount = SQLinsert (query,value)
            print("ROW: "+ str(rowcount) + " DODANO V BAZO: " + str(orderID) + " PRODUCT ID: " + str(detail['product_id']))
        else:
            if ((result[0]['product_quantity']) != detail['quantity'] ):
                query = "UPDATE productorder SET productorder.Product_total_price = %s, productorder.Product_quantity = %s WHERE Order_id = %s AND Product_id = %s"
                value = (detail['totalPrice'],detail['quantity'],orderID,detail['product_id'])
                mycursor = mydb.cursor()
                mycursor = mydb.cursor()
                mycursor.execute(query,value)
                mydb.commit()
                print(mycursor.rowcount, "POSDOBLJENO V BAZI; PRODUCT ID: " + str(detail['product_id']) + " NEW QUAN: "+ str(detail['quantity']))
    socketio.emit('checkDatabesOrders', broadcast=True)
    return ""

@app.route('/updateorderstatus/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrderStatus(orderID):
    data =  request.get_json(force=True) 
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = (data['order_status'],orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("UPDATE ORDER STATUS: " + str(orderID) + " NEW STATUS: " + str(data['order_status'])) 
    socketio.emit('checkDatabesOrders', broadcast=True)
    if(data['order_status'] == "CONFIRMED"):
        socketio.emit('CONFIRMED', orderID, broadcast=True)
    if(data['order_status'] == "SERVED"):
        socketio.emit('SERVED', orderID, broadcast=True)    
    if(data['order_status'] == "CALLING WAITER"):
        socketio.emit('CALLING_WAITER', orderID, broadcast=True)
    return ""

@app.route('/updateordercookstatus/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrderCookStatus(orderID):
    data =  request.get_json(force=True) 
    query = "UPDATE `order` SET Cook_status = %s WHERE Order_id = %s"
    value = (data['cook_status'],orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("UPDATE ORDER STATUS: " + str(orderID) + " NEW STATUS: " + str(data['cook_status'])) 
    socketio.emit('checkDatabesOrders', broadcast=True)
    # if(data['cook_status'] == "CONFIRMED"):
    #     socketio.emit('CONFIRMED', orderID, broadcast=True)
    # if(data['cook_status'] == "SERVED"):
    #     socketio.emit('SERVED', orderID, broadcast=True)
    return ""

@app.route('/endorder/<int:orderID>', methods=['POST']) #GET requests will be blocked
def endOrder(orderID):
    data =  request.get_json(force=True) 
    query = "UPDATE `order` SET Order_status = %s, Order_end = %s, User_id = %s WHERE Order_id = %s"
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")
    value = ("Finished",date_time,data['user_id'],orderID)
    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute(query,value)
    mydb.commit()
    print("ORDER END; ORDERID: " + str(orderID)) 
    # socketio.emit('checkDatabesOrders', broadcast=True)
    socketio.emit('orderEnd', orderID, broadcast=True)
    return ""
    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))


@app.route('/users', methods=['POST']) #GET requests will be blocked
def checkUsername():
    data =  request.get_json(force=True) 
    print("User: " + str(data['username']) + " Password: " + str(data['password']))
    query = "SELECT * FROM user WHERE user.User_name = '" + str(data['username']) + "' AND user.User_password = '" + str(data['password'])+"'"
    result = SQLqueryUser(query)
    new = {}
    if(len(result) == 0):
        new['result'] = "False"
        return new
    else:
        new['result'] = result[0]['user_role']
        new['user_id'] = result[0]['user_id']
        new['username'] = result[0]['user_name']
        return new
    # print("LEN: " + str(len(result)))
    # print("Result: " + str(result))
    # return ""

if __name__ == '__main__':
    socketio.run(app)