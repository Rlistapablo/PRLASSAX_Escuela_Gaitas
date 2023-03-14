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
cnxn,cursor=connect('192.168.1.201','Escuela_Gaitas','sa','abc123..')
for x in range(1,15):
    aula=str(x)+'A'
    cursor.execute(f"INSERT INTO Aula VALUES ('{aula}');")
    cnxn.commit()