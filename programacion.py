import requests
import json
url = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"
response = requests.get(url)

if response.status_code == 200:
    print("conectado")

vistas = []
menor = 0
mayor = 0
fechas = []
vieja = 0
actual = 0
rep_owners = []
may_rep = 0

response_json = json.loads(response.text)

def respuestas_obtenidas():
    qty_of_true = 0
    qty_of_false = 0
    for item in response_json["items"]:
        if item["is_answered"] == True:
            qty_of_true += 1
        else:
            qty_of_false += 1
    print(f"Cantidad de respuestas contestadas:  {qty_of_true} ")
    print(f"Cantidad de respuestas no contestadas:  {qty_of_false} ")


def contar_vistas():
    for item in response_json["items"]:
        vistas.append(int(item["view_count"]))
    menor = min(vistas)
    mayor = max(vistas)
    
    print("El menor numero de vistas es de: ", menor)
    print("El mayor numero de vistas es de: ", mayor)

def fechas_vieja_reciente():
    for item in response_json["items"]:
        fechas.append(item["creation_date"])
    vieja = min(fechas)
    actual = max(fechas)

    print("El dato de la respuesta mas vieja es: ", vieja)
    print("El dato de la respuesta mas actual es:", actual)

def reputación_owner():
    for item in response_json["items"]:
        rep_owners.append(item["owner"]["reputation"])
    may_rep = max(rep_owners)
    print("La mayor reputación es de : ", may_rep)


respuestas_obtenidas()
contar_vistas()
fechas_vieja_reciente()
reputación_owner()