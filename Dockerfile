FROM mcr.microsoft.com/dotnet/sdk:7.0


ENV STABLE_URL="https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_"
ENV UNSTABLE_URL="https://cdn.vintagestory.at/gamefiles/unstable/vs_server_linux-x64_"
ENV VINTAGE_STORY="/vintagestory"

RUN apt-get update
RUN apt-get install -y wget jq
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${VINTAGE_STORY}
RUN mkdir -p /mod

COPY download_vs.sh /
ENTRYPOINT ["/download_vs.sh"]

# https://cdn.vintagestory.at/gamefiles/pre/vs_client_linux-x64_1.20.0-pre.13.tar.gz