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
estilos=[filas[0] for filas in cursor.execute('SELECT ID_estilo FROM Estilo_de_música').fetchall()]
dicta=[]
for c in cursos:
    estilos_temp=[filas for filas in estilos]
    dicta2={'curso':c,'estilos':[]}
    for x in range(0,rd(1,2)):
        est=estilos_temp[rd(0,len(estilos_temp)-1)]
        dicta2['estilos'].append(est)
        estilos_temp.remove(est)
    dicta.append(dicta2)
for x in dicta:
    for y in range(0,len(x['estilos'])-1):
        cursor.execute(f"INSERT INTO Curso_Estilo VALUES ('{x['estilos'][y]}','{x['curso']}');")
        cnxn.commit()
