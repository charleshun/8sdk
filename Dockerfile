FROM ubuntu:focal

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        \
        # .NET dependencies
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu66 \
        libssl1.1 \
        libstdc++6 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*


RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -Channel 8.0 -InstallDir /usr/share/dotnet && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
#
#RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -Channel 8.0 -Runtime dotnet -InstallDir /usr/share/dotnet && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

#RUN apt-get update && apt-get install -y locales curl dotnet-sdk-7.0 && rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
#ENV LANG en_US.utf8



