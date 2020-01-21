import mysql.connector
import csv


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="DJzhulik1!",
  database="projectmanagementsystem"
)

mycursor=mydb.cursor()

with open('MasterList.csv') as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')
    for row in readCSV:
        pnum = row[0]
        dateCr = row[1]
        name = row[3]
        code = row[4]
        client = row[5]
        status = row[9]
        type = row[10]
        notes = row[14]
        po=row[16]
        #print("-" +dateCr +"-")

        #from datetime import datetime
        #date=datetime.strptime(dateCr , '%m/%d/%Y')

        sql = "INSERT INTO project (ProjectNumber, ProjectCode, ProjectName, Type, Client, Notes, Status, CreationDate, PO) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
        val = (pnum, code, name, type, client, notes, status, dateCr, po)
        mycursor.execute(sql, val)
        mydb.commit()

print(mycursor.rowcount, "record inserted.")