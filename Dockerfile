FROM ocelotuproar/docker-alpine-fsharp:4.0

RUN         mkdir -p /src
WORKDIR     /src

COPY        paket.dependencies /src
RUN         mono paket.exe restore || true

COPY        . /src

EXPOSE      8083
CMD         ["fsharpi", "/src/app.fsx"]
