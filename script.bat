@echo off

REM Ruta al archivo JSON
set "archivo=datos.json"

REM Leer el contenido del archivo JSON y encontrar el objeto "files"
for /f "tokens=1,* delims=:" %%a in ('type %archivo% ^| findstr /C:"\"files\""') do (
    REM Entrar en el bucle solo si encontramos el objeto "files"
    if "%%a"=="  \"files\"" (
        REM Saltar la línea del objeto "files" y entrar en un bucle para procesar los archivos
        for /f "tokens=1,* delims=}" %%c in ('findstr /C:"  {" %archivo%') do (
            REM Imprimir cada línea del archivo dentro del objeto "files"
            echo %%c}
        )
    )
)
