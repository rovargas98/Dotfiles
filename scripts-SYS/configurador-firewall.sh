#!/usr/bin/env bash

# ==============================================================================
# CONFIGURADOR DE PUERTOS DE FIREWALL (UFW) - DEVOPS SYSTEM
# ==============================================================================

# Colores para la salida
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${CYAN}======================================================${RESET}"
echo -e "${CYAN}   Configurador de Puerto Seguro (UFW & enp4s0)       ${RESET}"
echo -e "${CYAN}======================================================${RESET}\n"

# 1. Detectar el firewall activo
echo -e "${YELLOW}[1/4] Detectando Firewall...${RESET}"
if systemctl is-active --quiet ufw; then
    echo -e "${GREEN}✔ UFW (Uncomplicated Firewall) está ACTIVO en el sistema.${RESET}\n"
else
    echo -e "${RED}✘ UFW no está activo. Este script está diseñado para UFW.${RESET}"
    exit 1
fi

# 2. Detectar un puerto TCP libre
echo -e "${YELLOW}[2/4] Buscando un puerto TCP libre...${RESET}"
PUERTO=9090
while ss -tuln | grep -q ":$PUERTO "; do
    PUERTO=$((PUERTO + 1))
done
echo -e "${GREEN}✔ Puerto libre detectado: ${CYAN}$PUERTO${RESET}\n"

# 3. Preparar las reglas del cortafuegos
INTERFACE="enp4s0"
RED_PERMITIDA="192.168.1.0/24"

echo -e "${YELLOW}[3/4] Reglas a aplicar:${RESET}"
echo -e "  - Permitir tráfico de entrada en la interfaz: ${CYAN}$INTERFACE${RESET}"
echo -e "  - Desde la red de origen: ${CYAN}$RED_PERMITIDA${RESET}"
echo -e "  - Hacia el puerto TCP: ${CYAN}$PUERTO${RESET}"
echo -e "  - Bloquear el resto del tráfico externo hacia este puerto (política por defecto 'deny incoming').\n"

# 4. Aplicar o mostrar los comandos
echo -e "${YELLOW}[4/4] Ejecución de comandos:${RESET}"

CMD_ALLOW="ufw allow in on $INTERFACE from $RED_PERMITIDA to any port $PUERTO proto tcp"

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Aviso: No estás ejecutando el script como root.${RESET}"
    echo -e "Por favor, ejecuta el siguiente comando en tu terminal para aplicar la regla:"
    echo -e "\n  ${GREEN}sudo $CMD_ALLOW${RESET}\n"
    echo -e "Para comprobar el estado final de las reglas, ejecuta:"
    echo -e "  ${GREEN}sudo ufw status verbose${RESET}\n"
else
    echo -e "Aplicando regla UFW..."
    $CMD_ALLOW
    echo -e "${GREEN}✔ Regla aplicada con éxito.${RESET}"
    echo -e "Mostrando estado actual del cortafuegos:\n"
    ufw status verbose
fi

echo -e "${CYAN}======================================================${RESET}"
