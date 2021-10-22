#!/bin/bash

# Menu de gestion docker
# Autor: Altsys
# Email: info@altsys.es
# Version: 0.3

# limpiar pantalla
clear

# Funciones
function buscar_imagen(){
 echo ""
 echo "Nombre de la imagen:"
}

function listar_instalados(){
 echo ""
 echo "Lista de imagenes instaladas"
 echo ""
 docker images
}

function ejecutar_imagen(){
 echo ""
 echo "Ejecutar imagen instalada"
 echo ""
 docker images
 echo ""
 images=$(docker images | sed -e "1d" | awk '{print $3}')

 select item in $images
 do
  docker run $item
 done
}

echo ""
echo "##########################"
echo "# Menu de gestion Docker #"
echo "##########################"
echo ""

ACCIONES=("Listar imagenes instaladas" "Iniciar imagen" "Buscar imagen" "Salir")
PS3="Seleccione una opción: "

select action in "${ACCIONES[@]}"
do
    case $action in
         "Listar imagenes instaladas") listar_instalados
                break ;;
         "Iniciar imagen") ejecutar_imagen
           break ;;
         "Buscar imagen") buscar_imagen
                break ;;
         "Salir") break ;;
	 *) echo "invalid option";;
    esac
done
