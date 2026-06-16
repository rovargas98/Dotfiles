#!/usr/bin/env bash

# Colores para la salida en terminal
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

# Verificar que se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Error: Por favor, ejecuta este script como root (ej. sudo ./secure-docker-ufw.sh)${RESET}"
  exit 1
fi

echo -e "${CYAN}======================================================${RESET}"
echo -e "${CYAN}  Securización de Docker y UFW (Adaptado para CachyOS) ${RESET}"
echo -e "${CYAN}======================================================${RESET}\n"

# 1. Información sobre el binding de puertos
echo -e "${YELLOW}[1/4] Cerrar MySQL al exterior (Acción Manual Requerida)${RESET}"
echo -e "El script no puede adivinar dónde están tus contenedores. Debes editar tus archivos ${GREEN}docker-compose.yml${RESET} o scripts de ejecución:"
echo -e "  Cambia: ${RED}- \"3306:3306\"${RESET}"
echo -e "  Por:    ${GREEN}- \"127.0.0.1:3306:3306\"${RESET}\n"

# 2. Forzar Docker a respetar UFW
echo -e "${YELLOW}[2/4] Instalando y configurando ufw-docker...${RESET}"
if command -v wget &> /dev/null; then
    echo "Descargando script ufw-docker desde GitHub..."
    wget -q -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
    chmod +x /usr/local/bin/ufw-docker
    
    echo "Aplicando reglas de UFW para Docker..."
    ufw-docker install
    
    echo "Reiniciando UFW..."
    systemctl restart ufw
    echo -e "${GREEN}\u2714 ufw-docker instalado y UFW reiniciado correctamente.${RESET}\n"
else
    echo -e "${RED}Error: 'wget' no está instalado. Instálalo con 'sudo pacman -S wget' y vuelve a ejecutar.${RESET}\n"
    exit 1
fi

# 3. Corregir el MASQUERADE (Adaptado a tu interfaz)
echo -e "${YELLOW}[3/4] Corrección de MASQUERADE (Aviso)${RESET}"
echo -e "He detectado por tu salida de sistema que tu interfaz de red es ${CYAN}enp4s0${RESET} (no eth0)."
echo -e "Al haber instalado ufw-docker en el paso anterior, el filtrado está simplificado y no suele ser necesario hacer esto manualmente."
echo -e "Si aún necesitas editar las reglas de iptables de forma avanzada, recuerda usar ${CYAN}-o enp4s0${RESET} en lugar de -o eth0.\n"

# 4. Verificación
echo -e "${YELLOW}[4/4] Verificación de seguridad${RESET}"
echo -e "Una vez apliques los cambios en tus contenedores (Paso 1) y los reinicies, ejecuta lo siguiente desde ${RED}OTRA MÁQUINA${RESET}:"
echo -e "  ${GREEN}nc -zv TU_IP_PUBLICA 3306${RESET}"
echo -e "Si la respuesta es 'Connection refused' o 'Timeout', tu base de datos está segura.\n"

echo -e "${CYAN}======================================================${RESET}"
echo -e "${GREEN}Proceso de securización de red base completado.${RESET}"
