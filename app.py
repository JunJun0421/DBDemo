from flask import Flask,request,render_template
import MySQLdb

app=Flask(__name__)

@app.route('/')
def index():
    return render_template('ChooseClass.html')

@app.route('/action', methods=['POST'])
def action():
    my_class = request.form.get("my_class")
    conn = MySQLdb.connect(host="127.0.0.1",port=3306, user="Jun", passwd="1234", db="dbdemo")
    query = "SELECT  course_name FROM course where course_name LIKE '{}%';".format(my_class)
    cursor = conn.cursor()
    cursor.execute(query)
    results = """
    <p><a href="/">Back to Query Interface</a></p>
    """
    for (course_name, ) in cursor.fetchall():
        results += "<p>{}</p>".format(course_name)
    return results