import pyodbc
import datetime
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
cnxn,cursor=connect('192.168.1.201','Gaitas_Row','sa','abc123..')
def rand(list):
    return list[rd(0,len(list)-1)]
letter='ABCDEFGHIJKMNÑOPQRSTUVWXYZ'
profe=['Becario','Jefe','Jefe']
for x in range(1000,1225):
    cursor.execute(f"INSERT INTO alum_prof VALUES ('{str(x+5)}','{str(rd(1000,6999))+str(x)+rand(letter)}','{rand(profe)}');")
    cnxn.commit()

