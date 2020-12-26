import mysql.connector
import json

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="webwaiter"
)

mycursor = mydb.cursor()
myresult = mycursor.execute("SELECT * FROM foods")
myresult = mycursor.fetchall()
items = []
print(myresult)
print("-----------")
for row in myresult:
    items.append({'id': row[0], 'name': row[1]})


print(items[1])
