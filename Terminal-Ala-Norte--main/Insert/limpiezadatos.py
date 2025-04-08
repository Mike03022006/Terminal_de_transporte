import re
from pathlib import Path

archivo_entrada = "C:/Users/USUARIO/OneDrive/Documentos/BD_Terminal/Insert/datosSur.sql"
archivo_salida = "C:/Users/USUARIO/OneDrive/Documentos/BD_Terminal/Insert/datosSur_reformateado.sql"
with open(archivo_entrada, "r", encoding="utf-8", errors="replace") as f:
    contenido = f.read()
insert_grupos = {}
patron_insert = re.compile(
    r"INSERT INTO\s+`?(\w+)`?\s*\((.*?)\)\s*VALUES\s*\((.*?)\);?", re.DOTALL)

for match in patron_insert.finditer(contenido):
    tabla = match.group(1)
    campos = match.group(2).strip()
    valores = match.group(3).strip()

    key = (tabla, campos)
    if key not in insert_grupos:
        insert_grupos[key] = []
    insert_grupos[key].append(valores)

datos_agrupados_norte = ""
for (tabla, campos), valores_lista in insert_grupos.items():
    datos_agrupados_norte += f"INSERT INTO {tabla} ({campos}) VALUES\n"
    datos_agrupados_norte += ",\n".join(f"({val})" for val in valores_lista)
    datos_agrupados_norte += ";\n\n"

with open(archivo_salida, "w", encoding="utf-8") as f:
    f.write(datos_agrupados_norte)

print("Listo, se guardo con el nombre:", archivo_salida)
