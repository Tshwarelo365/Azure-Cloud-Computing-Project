#this is the installation of flask

from flask import Flask, render_template
from five import fetch_student_records 

app = Flask(__name__)

@app.route('/')
def index():
    student_records = fetch_student_records() 

    return render_template('index.html', student_records=student_records)

if __name__ == '__main__':
    app.run()

