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
aulas=[filas[0] for filas in cursor.execute('SELECT ID_Aula FROM Aula').fetchall()]
nombres=['Gaita Tirolesa','Gaita Gallega','Gaita_Escocesa','Gaita Irlandesa','Gaita Asturiana']
nivel=['Alto','Medio','Bajo']
for x in range(100,110):
    year=rd(2010,2019)
    cursor.execute(f"INSERT INTO Curso VALUES ('{str(rd(100,999))+str(x)+'C'}','{aulas[rd(0,len(aulas)-1)]}','{nombres[rd(0,len(nombres)-1)]+' '+nivel[rd(0,len(nivel)-1)]}','{datetime.date(year,9,15)}','{datetime.date(year+1,9,15)}','Curso de gaitas')")
    cnxn.commit()