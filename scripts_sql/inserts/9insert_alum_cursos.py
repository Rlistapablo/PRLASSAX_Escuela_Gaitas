import pyodbc
import datetime
import time
from random import randint as rd

def connect(server,database,username,password):
    try:
        cnxn=pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
        cursor = cnxn.cursor()
        print('Conectado')
        return cnxn,cursor
    except Exception as ex:
        print(ex)
        exit()
cnxn,cursor=connect('localhost','prl_EscuelaGaitas','sa','masterkey')
cursos=[filas[0] for filas in cursor.execute('SELECT ID_Curso FROM Curso').fetchall()]
alumnos=[filas[0] for filas in cursor.execute('SELECT NIF FROM Alumnos').fetchall()]
dicta=[]
for c in cursos:
    alumnos_temp=[filas for filas in alumnos]
    dicta2={'curso':c,'alumnos':[]}
    for x in range(0,rd(15,20)):
        est=alumnos_temp[rd(0,len(alumnos_temp)-1)]
        dicta2['alumnos'].append(est)
        alumnos_temp.remove(est)
    dicta.append(dicta2)

for x in dicta:
    for y in range(0,len(x['alumnos'])-1):
        cursor.execute(f"INSERT INTO Alumno_curso VALUES ('{x['alumnos'][y]}','{x['curso']}');")
        cnxn.commit()
