from flask import Flask, request, render_template
import MySQLdb

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('ChooseClass.html')

@app.route('/submit', methods=['POST'])
def submit():
    action = request.form.get("action")
    student_id = int(request.form.get("student_id"))
    course_id = int(request.form.get("course_id"))
    conn = MySQLdb.connect(host="127.0.0.1", port=3306, user="Jun", passwd="1234", db="dbdemo")
    cursor = conn.cursor()

    if action == "add":

        cursor.execute(f"SELECT department, recent_credit, max_credit,student_name FROM student WHERE id = {student_id};")
        st_data = cursor.fetchone()
        st_dep = st_data[0]
        st_rcre = st_data[1]
        st_mcre = st_data[2]
        st_name = st_data[3]

        cursor.execute(f"SELECT department, is_required, course_name, course_time1, course_time2, course_time3, credit, max_people,recent_people,instructor FROM course WHERE id = {course_id};")
        co_data = cursor.fetchone()
        co_dep = co_data[0]
        co_isr = co_data[1]
        co_name = co_data[2]
        co_t1 = co_data[3]
        co_t2 = co_data[4]
        co_t3 = co_data[5]
        co_cre = co_data[6]
        co_maxp = co_data[7]
        co_repe = co_data[8]
        co_in = co_data[9]
        
        if st_dep == co_dep and co_maxp > co_repe and st_rcre + co_cre <= st_mcre:
            cursor.execute(f"INSERT INTO choosen (student_id, course_id, course_name, course_time1, course_time2, course_time3, department,instructor, credit, max_people, is_required) VALUES ({student_id}, {course_id}, '{co_name}', '{co_t1}', '{co_t2}', '{co_t3}', '{co_dep}','{co_in}', {co_cre}, {co_maxp}, {co_isr});")
            conn.commit()
            cursor.execute(f"UPDATE course SET recent_people = recent_people+1 WHERE id={course_id};")
            conn.commit()
            cursor.execute(f"UPDATE choosen SET re_people = re_people+1 WHERE course_id={course_id};")
            conn.commit()
            cursor.execute(f"UPDATE student SET recent_credit = recent_credit+{co_cre} WHERE id={student_id};")
            conn.commit()
            cursor.execute(f"SELECT * FROM choosen;")
            aa=cursor.fetchone()
            print(aa)
            return "Success."
        else:
            return "Failed to add course. Please check requirements."

    elif action == "drop":
        cursor.execute(f"SELECT department, recent_credit, max_credit,min_credit FROM student WHERE id = {student_id};")
        st_data = cursor.fetchone()
        st_dep = st_data[0]
        st_rcre = st_data[1]
        st_mcre = st_data[2]
        st_mincre=st_data[3]

        cursor.execute(f"SELECT department, is_required, course_name, course_time1, course_time2, course_time3, credit, max_people,instructor FROM course WHERE id = {course_id};")
        co_data = cursor.fetchone()
        co_dep = co_data[0]
        co_isr = co_data[1]
        co_name = co_data[2]
        co_t1 = co_data[3]
        co_t2 = co_data[4]
        co_t3 = co_data[5]
        co_cre = co_data[6]
        co_maxp = co_data[7]
        co_in = co_data[8]

        if co_isr == True:
            cursor.execute(f"UPDATE course SET recent_people = recent_people-1 WHERE id={course_id};")
            conn.commit()
            cursor.execute(f"UPDATE choosen SET re_people = re_people-1 WHERE course_id={course_id};")
            conn.commit()
            cursor.execute(f"DELETE FROM choosen WHERE student_id = {student_id} AND course_id = {course_id};")
            conn.commit()
            cursor.execute(f"UPDATE student SET recent_credit = recent_credit-{co_cre} WHERE id={student_id};")
            conn.commit()
            return "The course is required! Please check again!"
        
        if st_rcre-co_cre<st_mincre:
            return "The credit is not enough!"
        
        

if __name__ == "__main__":
    app.run(debug=True)
