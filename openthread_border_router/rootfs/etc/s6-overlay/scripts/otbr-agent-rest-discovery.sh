#!/usr/bin/with-contenv bashio
# ==============================================================================
# Send OTBR discovery information to Home Assistant
# ==============================================================================
declare config

config=$(bashio::var.json \
    host "$(hostname)" \
    port "^8081" \
)

# Send discovery info
if bashio::discovery "otbr" "${config}" > /dev/null; then
    bashio::log.info "Successfully sent discovery information to Home Assistant."
else
    bashio::log.error "Discovery message to Home Assistant failed!"
fi
