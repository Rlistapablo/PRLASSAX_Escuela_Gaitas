import pyodbc
import datetime
import time
from random import randint as rd
#from PIL import Image
import binascii
import io
def connect(server,database,username,password):
    try:
        cnxn=pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
        cursor = cnxn.cursor()
        print('Conectado')
        return cnxn,cursor
    except Exception as ex:
        print(ex)
        exit()
cnxn,cursor=connect('192.168.1.201','EscuelaGaitas_prl','sa','abc123..')
gaitas=['Gaita Gallega','Gaita Asturiana','Gaita Escocesa','Gaita irlandesa']
image=[]
for x in range(0,len(gaitas)):
    path = "gaitas\\"+str(x)+".png"
    with open(path, 'rb') as file:
        image.append(binascii.hexlify(file.read()))
for x in range(0,len(gaitas)-1):
    id=str(x+1)+'G'
    q=f"INSERT INTO Tipos_de_gaitas VALUES ('{id}','{gaitas[x]}','{image[x]}');"
    cursor.execute(q)
    cnxn.commit()

