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
cnxn,cursor=connect('192.168.1.201','Gaitas_Personas','sa','abc123..')
Intrumentos=['Gaita Gallego','Gaitas Asturiana','Gaita Escocesa','Gaita Tirolesa','Gaitas Electrica']
Marcas=['Honey','MusicCorp','AntiGaitasCorp','Sony','GaitasInd']
for x in range(2,40):
    cursor.execute(f"INSERT instrumentos2(ID,Instrumento,Marca,Fecha_Compra) VALUES ({str(x)},'{Intrumentos[rd(0,len(Intrumentos)-1)]}','{Marcas[rd(0,len(Marcas)-1)]}','{datetime.date(rd(2010,2019),rd(1,12),rd(1,15))}');")
    cnxn.commit()
