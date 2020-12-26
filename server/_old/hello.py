from flask import Flask, jsonify
app = Flask(__name__)


import mysql.connector
import json

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="webwaiter"
)
items=[]
print("RUNNING........")
print("RUNNING........")
mycursor = mydb.cursor()
myresult = mycursor.execute("SELECT * FROM foods")
myresult = mycursor.fetchall()
payload = []
content = {}
for result in myresult:
    content = {'id': result[0], 'name': result[1]}
    payload.append(content)
    content = {}



@app.route('/')
def hello_world():
    return jsonify({'in' : 'progress'})

@app.route('/drinks')
def allDrinks():
    #return jsonfiy(db.(SELECT * FROM DRINKS))
    return jsonify(
    {
      "id": 1,
	  "al. drink": 1,
	  "type": "Beer",
      "name": "Union",
      "description": "Slovenian beer, made in ...."
    },
    {
      "id": 2,
	  "al. drink": 1,
	  "type": "Cocktail",
      "name": "Mojito",
      "description": "Cuban drink"
    },
    {
      "id": 3,
	  "al. drink": 0,
	  "type": "Juice",
      "name": "Fructal peach",
      "description": "Slovenian none alc. drink"
    },
	  {
      "id": 4,
	  "al. drink": 0,
	  "type": "TEST",
      "name": "Fructal limon",
      "description": "Slovenian none alc. drink"
    }
    )

@app.route('/foods')
def allFoods():
    return jsonify(payload)


if __name__ == '__main__':
    app.run(debug=True)