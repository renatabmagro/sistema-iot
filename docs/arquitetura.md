# Arquitetura do Sistema

## Camadas do Sistema

### Physical/Edge Layer
- ESP32 + Sensor DHT22
- Responsável pela coleta dos dados ambientais

### Fog Layer
- Raspberry Pi com Eclipse Kura
- Faz ponte entre ESP32 e nuvem via MQTT

### Cloud Layer
- Eclipse Kapua + Mosquitto + PostgreSQL/TimescaleDB
- Armazenamento, análise e gerenciamento de dispositivos

## Fluxo de Dados

1. ESP32 le dados do sensor
2. Envia via MQTT para o Raspberry Pi (Kura)
3. Kura retransmite para o broker MQTT (Mosquitto) no Kapua
4. Dados são armazenados no PostgreSQL/TimescaleDB
5. Interface web consome os dados via API ou WebSocket
