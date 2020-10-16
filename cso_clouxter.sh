# ! /bin/bash
# programa para ejemplificar facilitar las actividades de monitoreo
# autor: Oscar Vargas Email :oscar.vargas@gmail.com

option=""

#Funcion para instalar cw agent en distribuciones debian

#Funcion para mirar procesos actuales
consumo_recursos () {
     top
    }

#Funcion para mirar procesos actuales
procesos_actuales () {
   read -p "Ingresar proceso a buscar " proceso
   ps aux | grep $proceso
    }

#Funcion para mirar procesos actuales
memoria_disponible () {
    free -h
    }

#Funcion para mirar procesos actuales
limpiar_memoria_disponible () {
 sudo echo 3 > /proc/sys/vm/drop_caches
   free -h
    }
    #Funcion para mirar procesos actuales
disco_disponible () {
    df -h
    }


#Funcion para mirar procesos actuales
procesos_red () {
    netstat -tulpn
    }

#Funcion para mirar procesos actuales
empaquetar_salvar () {
    read -p " ingreso el nombre del archivo o la extesion de los archivos que desea  *.xxx " dir
    tar -cvf respaldo.tar $dir
    gzip respaldo.tar
    zip -e respaldo *.tar.gz
    echo "Respaldo hecho"
    }

while :
do
   # Limpiar pantalla
   clear
   # Ascii art
   echo -e "
   ___  _                      _                   __   _    __    __  __    \n
  / __\| |  ___   _   _ __  __| |_   ___  _ __    / /  /_\  / / /\ \ \/ _\   \n
 / /   | | / _ \ | | | |\ \/ /| __| / _ \| '__|  / /  //_\\ \ \/  \/ /\ \    \n
/ /___ | || (_) || |_| | >  < | |_ |  __/| |    / /  /  _  \ \  /\  / _\ \   \n
\____/ |_| \___/  \__,_|/_/\_\ \__| \___||_|   /_/   \_/ \_/  \/  \/  \__/   \n
   "
     #Desplegar menu de opciones
   echo "___________________________________________"
   echo "     - Programa de utilidad de SysOps      "
   echo "___________________________________________"
   echo "           MENU PRINCIPAL                  "
   echo "___________________________________________"
   echo "1. consumo de recursos                     "
   echo "2. busqueda de procesos por usuario o servicio "
   echo "3. Memoria libre"
   echo "4. Limpiar memoria "
   echo "5. Espacio en Disco"
   echo "6. Proceso de red "
   echo "7. Empaquetar y comprimir archivos o carpetas"

   echo "0. Salir"

   # leer los datos del usuario
   read -n1 -p "Ingrese una opción [0-9]" opcion

  # validar la opcion de ingresada
  case $opcion in
  1)
     echo -e  "\n Consumo de recursos."
     consumo_recursos
     sleep 5
     ;;
  2)
     echo -e "\n busqueda de procesos por usuario o servicio."
     procesos_actuales
     sleep 5
     ;;
  3)
     echo -e "\n Memoria libre....."
     memoria_disponible
     sleep 5
     ;;
  4)
     echo -e  "\n Limpiar memoria"
     limpiar_memoria_disponible
     sleep 5
     ;;
  5)
     echo -e  "\n Espacio en Disco"
     disco_disponible
     sleep 5
     ;;
  6)
       echo -e "\n Proceso de red"
     procesos_red
     sleep 5
     ;;

   7)
     echo -e  "\n Comprimir archivos"
     empaquetar_salvar
     sleep 5
     ;;
  0)
    echo -e "\n Saliendo Muchas Gracias "
    exit 0
    ;;
  esac
done

