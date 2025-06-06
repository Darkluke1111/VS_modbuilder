#!/bin/sh

cd ${VINTAGE_STORY}

wget -q "${STABLE_URL}${VERSION}.tar.gz"
tar xzf vs_server_linux-x64_${VERSION}.tar.gz
rm vs_server_linux-x64_${VERSION}.tar.gz

cd /mod
for filename in *; do
    echo "${filename}"
    dotnet run --project ./${filename}/ZZCakeBuild/CakeBuild.csproj -- "$@"
done

