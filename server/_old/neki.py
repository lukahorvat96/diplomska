from flask import Flask, jsonify
from flaskext.mysql import MySQL
print("RUNNNINGGGG.....")
app = Flask(__name__)
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'webwaiter'
mysql = MySQL(app)

@app.route('/hello')
def index():
   cur = mysql.connection.cursor()
   cur.execute('''SELECT * FROM Foods WHERE id=1''')
   rv = cur.fetchall()
   payload = []
   content = {}
   for result in rv:
       content = {'id': result[0], 'name': result[1]}
       payload.append(content)
       content = {}
   return jsonify(payload)


if __name__ == '__main__':
    app.run(debug=True)