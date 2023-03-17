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
estilos=['punk','folclore','baile galego','electronico','sinfonico']
for x in range(0,len(estilos)-1):
    cursor.execute(f"INSERT INTO Estilo_de_música VALUES ('{str(x+1)+'M'}','{estilos[x]}')")
    cnxn.commit()