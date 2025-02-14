FROM docker:dind

# Instala las dependencias necesarias
RUN apk add --no-cache bash git openjdk11 nodejs npm python3 curl && \
    curl -s https://get.sdkman.io | bash && \
    /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install kotlin" && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Clona el primer repositorio
RUN git clone https://github.com/KidmanC/Docker /app

# Establece el directorio de trabajo
WORKDIR /app

# Da permisos de ejecución al script
RUN chmod +x run-benchmarks.sh

# Ejecuta el script al iniciar el contenedor
CMD ["./run-benchmarks.sh"]