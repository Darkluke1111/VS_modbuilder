FROM mcr.microsoft.com/dotnet/sdk:7.0


ENV STABLE_URL="https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_"
ENV UNSTABLE_URL="https://cdn.vintagestory.at/gamefiles/unstable/vs_server_linux-x64_"
ENV VINTAGE_STORY="/vintagestory"

# Install required packages
RUN apt-get update && apt-get install -y \
    wget jq \
    && rm -rf /var/lib/apt/lists/* \
    apt-get install dos2unix

RUN useradd -u 1000 -m -s /bin/bash gameserver

RUN mkdir -p ${VINTAGE_STORY}
RUN mkdir -p /mod
RUN chown -R gameserver:gameserver ${VINTAGE_STORY}
RUN chown -R gameserver:gameserver /mod

COPY download_vs.sh /
ENTRYPOINT ["/download_vs.sh"]

# https://cdn.vintagestory.at/gamefiles/pre/vs_client_linux-x64_1.20.0-pre.13.tar.gz