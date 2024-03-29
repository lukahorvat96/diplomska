from flask import Flask, jsonify, request
from datetime import datetime
from flask_cors import CORS
from flask_socketio import SocketIO, send, emit
from flaskext.mysql import MySQL
from flask_login import LoginManager
from flask_login import login_user
from flask_login import UserMixin
from flask_sqlalchemy import SQLAlchemy
import bcrypt

app = Flask(__name__)
#app.config['SECRET_KEY'] = 'secret!'
app.debug = True
CORS(app)
socketio = SocketIO(app, cors_allowed_origins="*")
#cors = CORS(app, resources={r"/api/*": {"origins": "*"}})
app.config['JSON_SORT_KEYS'] = False #unordered json object
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

#import mysql.connector
import json

# mydb = mysql.connector.connect(
#   host="localhost", 
#   user="root",
#   passwd="",
#   database="newprojectdb"
# )

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'newprojectdb'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost/newprojectdb'

mydb = MySQL(app)
mydb.init_app(app)

db = SQLAlchemy(app)
class User(UserMixin, db.Model):
    user_id = db.Column(db.Integer, primary_key=True)
    user_role = db.Column(db.String)
    user_name = db.Column(db.String)
    user_password = db.Column(db.String)
    def get_id(self):
           return (self.user_id)

db.init_app(app)

login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def user_loader(user_id):
    return User.query.get(int(user_id))


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
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    mycursor.close()
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
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    mycursor.close()
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
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    mycursor.close()
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
    return payload

def SQLqueryOrder2(query, data):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query, data)
    myresult = mycursor.fetchall()
    mycursor.close()
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
    return payload

def SQLqueryLastID():
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute("SELECT LAST_INSERT_ID()")
    myresult = mycursor.fetchall()
    mycursor.close()
    for result in myresult:
        last = result[0]
    return str(last)

def SQLinsert(query, values):
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query, values)
    mydb.get_db().commit()
    mycursor.close()
    print("adding...."+str(mycursor.rowcount))
    return mycursor.rowcount

def SQLqueryAllOrdersProducts(query):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query)
    myresult = mycursor.fetchall()
    mycursor.close()
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

def SQLqueryAllProductByID(query, data):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query, data)
    myresult = mycursor.fetchall()
    mycursor.close()
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

def SQLqueryOrderProduct(query, productid, orderid):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query, (productid, orderid))
    myresult = mycursor.fetchall()
    mycursor.close()
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

def SQLqueryUser(query, data):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query,(data['username']))
    myresult = mycursor.fetchall()
    mycursor.close()
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

def SQLqueryOrderStatus(query, data):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query, data)
    myresult = mycursor.fetchall()
    mycursor.close()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'order_status': result[0], 
        }
        payload.append(content)
        content = {}
    return payload
    
def SQLqueryProductType(query, data):
    mycursor = mydb.get_db().cursor()
    myresult = mycursor.execute(query, data)
    myresult = mycursor.fetchall()
    mycursor.close()
    payload = []
    content = {} 
    for result in myresult:
        content = {
            'product_type': result[0], 
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
    return jsonify(SQLqueryProduct("SELECT * FROM product, producttype WHERE \
    product.ProductType_id=producttype.ProductType_id AND producttype.ProductType_type='Drink'"))

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

@app.route('/ordersWithoutEnd/<int:user_id>', methods=['GET'])
def allOrdersWithoutEnd(user_id):
    new = {}
    new['orders'] = SQLqueryOrder2('SELECT * FROM `order` WHERE Order_status != "FINISHED" AND ( User_id IS NULL OR User_id = %s )', user_id)
    new['ordersfood'] = SQLqueryOrder("SELECT DISTINCT `order`.`Order_id`, `order`.`Order_start`, `order`.`Order_end`, `order`.`Table_id`, `order`.`User_id`, `order`.`Order_status`, `order`.`Cook_status`, `order`.`Payment` FROM `order`, productorder, product, producttype WHERE `order`.Order_id = productorder.Order_id AND productorder.Product_id = product.Product_id AND product.ProductType_id = producttype.ProductType_id AND producttype.ProductType_type = 'Food' AND `order`.`Order_status` != 'FINISHED'")
    return new
 
@app.route('/ordersFoodWithoutEnd ')
def allOrdersFoodWithoutEnd():
    return jsonify(SQLqueryOrder("SELECT `order`.`Order_id`, `order`.`Order_start`, `order`.`Order_end`, `order`.`Table_id`, `order`.`User_id`, `order`.`Order_status`, `order`.`Cook_status`, `order`.`Payment` FROM `order`, productorder, product, producttype WHERE `order`.Order_id = productorder.Order_id AND productorder.Product_id = product.Product_id AND product.ProductType_id = producttype.ProductType_id AND producttype.ProductType_type = 'Food' AND `order`.`Order_end` IS NULL"))

@app.route('/orderstatus/<int:order>', methods=['GET']) #GET requests will be blocked
def getOrderStatus(order):
    return jsonify(SQLqueryOrderStatus("SELECT order_status FROM `order` WHERE order.order_id = %s", order))

@app.route('/orders/<int:order>', methods=['GET']) #GET requests will be blocked
def getOrderById(order):
    return jsonify(SQLqueryAllProductByID("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id AND productorder.Order_id = %s", order))

@app.route('/allordersproducts') #GET requests will be blocked
def getAllOrdersProducts():
    return jsonify(SQLqueryAllOrdersProducts("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id"))

@app.route('/addorder/<int:table>', methods=['POST']) #GET requests will be blocked
def addOrder(table):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")  #current time in the requested format
    query = "INSERT INTO `order` (Order_start, Table_id, Order_status, Cook_status) VALUES (%s,%s,%s,%s)"
    value = (date_time, table, "PLACED","")
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


@app.route('/addorderoncall/<int:table>', methods=['POST']) #GET requests will be blocked
def addOrderOnCall(table):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")  #current time in the requested format
    query = "INSERT INTO `order` (Order_start, Table_id, Order_status) VALUES (%s,%s,%s)"
    value = (date_time, table, "CALLING WAITER")
    rowcount = SQLinsert(query,value)
    Order_id = SQLqueryLastID()
    print(str(rowcount) + " ORDER was inserted. Order ID: " + Order_id)
    socketio.emit('checkDatabesOrders', broadcast=True)
    return Order_id

@app.route('/updateorderwaiter/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrderWaiter(orderID):
    data =  request.get_json(force=True) #force = ignore the request.headers.get('Content-Type') == 'application/json'
    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))
    #če je quantity enak orderqunatity #1 še ne obstaja v bazi; #2 je že v bazi - preveri!
    #SELECT * FROM productorder where productorder.Product_id = 4 AND productorder.Order_id=33
    result = SQLqueryOrder2("SELECT * FROM `order` where Order_id= %s", orderID)
    #print(str(result))
    # if (result[0]['order_status'] != "Not served" ):
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = ("CHANGED", orderID)
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query,value)
    mydb.get_db().commit()
    mycursor.close()
    productinorder = SQLqueryAllProductByID("SELECT * FROM product, productorder WHERE product.Product_id= productorder.Product_id AND productorder.Order_id = %s", orderID)
    for product in productinorder:
        ordered = False
        for detail in data:
            if(product['product_id'] == detail['product_id']):
                ordered = True
                result = SQLqueryOrderProduct("SELECT * FROM productorder where productorder.Product_id = %s AND productorder.Order_id= %s", detail['product_id'], orderID)
                if ((result[0]['product_quantity']) != detail['quantity'] ):
                    query = "UPDATE productorder SET productorder.Product_total_price = %s, productorder.Product_quantity = %s WHERE Order_id = %s AND Product_id = %s"
                    value = (detail['totalPrice'],detail['quantity'],orderID,detail['product_id'])
                    mycursor = mydb.get_db().cursor()
                    mycursor.execute(query,value)
                    mydb.get_db().commit()
                    mycursor.close()
                    print(mycursor.rowcount, "POSDOBLJENO V BAZI; PRODUCT ID: " + str(detail['product_id']) + " NEW QUAN: "+ str(detail['quantity']))
        if(ordered == False):
            query = "DELETE FROM productorder WHERE productorder.order_id = %s AND productorder.product_id = %s"
            value = (orderID, product['product_id'])
            mycursor = mydb.get_db().cursor()
            mycursor.execute(query,value)
            mydb.get_db().commit()
            mycursor.close()
            print(mycursor.rowcount, "DELETED FROM DB; PRODUCT ID: " + str(product['product_id']))
            # socketio.emit('checkDatabesOrders', broadcast=True)
    socketio.emit('orderChanged', orderID, broadcast=True)
    return ""

@app.route('/updateorder/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrder(orderID):
    data =  request.get_json(force=True) 
    isFood = 0
    for detail in data:
        result = SQLqueryOrderProduct("SELECT * FROM productorder where productorder.Product_id = %s AND productorder.Order_id= %s", detail['product_id'], orderID)
        productType = SQLqueryProductType("SELECT producttype.ProductType_type FROM producttype, product WHERE producttype.ProductType_id = product.ProductType_id AND product.Product_id = %s", detail['product_id'])
        print("PRODUCT TYPE: -"+ str(productType[0]['product_type'])+"-")
        if len(result) == 0:
            print("DODAJAM V BAZO!")
            query = '''INSERT INTO `productorder` ( Product_id, 
                                                    Order_id,
                                                    Product_total_price,
                                                    Product_quantity ) VALUES (%s,%s,%s,%s)'''
            value = (detail['product_id'],orderID,detail['totalPrice'],detail['quantity'])
            rowcount = SQLinsert (query,value)
            print("ROW: "+ str(rowcount) + " DODANO V BAZO: " + str(orderID) + " PRODUCT ID: " + str(detail['product_id']))
            if(productType[0]['product_type'] == "Food"):
                isFood = isFood + 1
        else:
            if ((result[0]['product_quantity']) != detail['quantity'] ):
                query = "UPDATE productorder SET productorder.Product_total_price = %s, productorder.Product_quantity = %s WHERE Order_id = %s AND Product_id = %s"
                value = (detail['totalPrice'],detail['quantity'],orderID,detail['product_id'])
                mycursor = mydb.get_db().cursor()
                mycursor.execute(query,value)
                mydb.get_db().commit()
                mycursor.close()
                print(mycursor.rowcount, "POSDOBLJENO V BAZI; PRODUCT ID: " + str(detail['product_id']) + " NEW QUAN: "+ str(detail['quantity']))
                if(productType[0]['product_type'] == "Food"):
                    isFood = isFood + 1
    print("IS FOOD: "+str(isFood))
    if(isFood != 0):
        query = "UPDATE `order` SET Order_status = %s, Cook_status = %s WHERE Order_id = %s"
        value = ("UPDATED", "UPDATED", orderID)
        print("UPDATED DRINK AND FOOD")
    else:
        query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
        value = ("UPDATED", orderID)
        print("UPDATED DRINK")
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query,value)
    mydb.get_db().commit()
    mycursor.close()

    socketio.emit('checkDatabesOrders', broadcast=True)
    return ""

@app.route('/updateorderstatus/<int:orderID>', methods=['POST']) #GET requests will be blocked
def updateOrderStatus(orderID):
    data =  request.get_json(force=True) 
    query = "UPDATE `order` SET Order_status = %s WHERE Order_id = %s"
    value = (data['order_status'],orderID)
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query,value)
    mydb.get_db().commit()
    mycursor.close()
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
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query,value)
    mydb.get_db().commit()
    mycursor.close()
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
    value = ("FINISHED",date_time,data['user_id'],orderID)
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query,value)
    mydb.get_db().commit()
    mycursor.close()
    print("ORDER END; ORDERID: " + str(orderID)) 
    # socketio.emit('checkDatabesOrders', broadcast=True)
    socketio.emit('orderEnd', orderID, broadcast=True)
    return ""
    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))

@app.route('/finishorder/<int:orderID>', methods=['POST']) #GET requests will be blocked
def finshOrder(orderID):
    data =  request.get_json(force=True) 
    query = "UPDATE `order` SET Order_status = %s, Order_end = %s, Payment = %s WHERE Order_id = %s"
    now = datetime.now()
    date_time = now.strftime("%Y-%m-%d %H:%M:%S.%f")
    value = ("INVOICE",date_time,data['order_payment'],orderID)
    mycursor = mydb.get_db().cursor()
    mycursor.execute(query,value)
    mydb.get_db().commit()
    mycursor.close()
    print("ORDER END; ORDERID: " + str(orderID)) 
    socketio.emit('checkDatabesOrders', broadcast=True)
    # socketio.emit('orderEnd', orderID, broadcast=True)
    return ""
    # print("ORDER DATA: "+ str(data) + "\norderID: " + str(orderID))


@app.route('/login', methods=['POST']) #GET requests will be blocked
def checkUsername():
    new = {}
    print (db)
    data =  request.get_json(force=True) 
    print("User: " + str(data['username']) + " Password: " + str(data['password']))
    result = SQLqueryUser("SELECT * FROM user WHERE user.User_name = %s", data)
    if(len(result) == 0):
        print("User Does not Exist")
        new['result'] = "False"
        return new
    passwordDB = str.encode(result[0]['user_password'])
    hashed = bcrypt.hashpw(passwordDB, bcrypt.gensalt())
    if bcrypt.checkpw(str.encode(data['password']), hashed):
        print("Password Match :)")
        user = User.query.filter_by(user_name=result[0]['user_name']).first()
        # user = User(result[0]['user_id'])
        login_user(user, remember=True)
        # user = User.query.get(     )
        # user.authenticated = True
        # db.session.add(user)
        # db.session.commit()
        
        new['result'] = result[0]['user_role']
        new['user_id'] = result[0]['user_id']
        new['username'] = result[0]['user_name']
        return new
    else:
        print("Password Does not Match :(")
        new['result'] = "False"
        return new


@app.route('/logout') 
def logout():
    logout_user()
    return "User logout successfully"


if __name__ == '__main__':
    socketio.run(app)