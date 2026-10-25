#!/usr/bin/env bash
# ==============================================================================
# HABILITAR CONEXIÓN DEL MÓVIL (KDE CONNECT & SPOTUBE) EN UFW Y AVAHI
# Permite emparejar el teléfono (192.168.1.133) con el PC (192.168.1.151)
# ==============================================================================

if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root: sudo $0"
  exit 1
fi

SUBNET="192.168.1.0/24"

echo "[1/4] Abriendo puertos de KDE Connect (1714-1764 TCP/UDP) para la LAN..."
ufw allow from $SUBNET to any port 1714:1764 proto tcp comment "KDE Connect TCP"
ufw allow from $SUBNET to any port 1714:1764 proto udp comment "KDE Connect UDP"

echo "[2/4] Verificando puerto de Spotube Connect (9090 TCP)..."
ufw allow from $SUBNET to any port 9090 proto tcp comment "Spotube Connect"

echo "[3/4] Publicando servicio de Spotube en mDNS (Avahi) para detección automática..."
cat << 'EOF' > /etc/avahi/services/spotube.service
<?xml version="1.0" standalone='no'?>
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
  <name replace-wildcards="yes">%h (Spotube Desktop)</name>
  <service>
    <type>_spotube._tcp</type>
    <port>9090</port>
    <txt-record>id=rocachyos-spotube</txt-record>
  </service>
</service-group>
EOF

systemctl restart avahi-daemon

echo "[4/4] Recargando UFW..."
ufw reload

echo ""
echo "======================================================================="
echo "✅ ¡TODO CONFIGURADO CON ÉXITO!"
echo "Los puertos están abiertos y el PC ya es visible para tu teléfono."
echo "======================================================================="
