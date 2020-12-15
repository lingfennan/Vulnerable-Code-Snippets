FROM ubuntu:latest

# the basic environment
RUN apt-get update -yqq
RUN apt-get install -yqq automake build-essential libtool
RUN apt-get install -yqq gcc g++ git wget zip
RUN dpkg --configure -a
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -yqq tzdata

# get codeql
WORKDIR /root/
RUN wget https://github.com/github/codeql-cli-binaries/releases/download/v2.4.0/codeql-linux64.zip
RUN unzip codeql-linux64.zip
RUN git clone --depth=1 https://github.com/github/codeql.git codeql-repo
ENV PATH="/root/codeql:$PATH"
RUN ls -l /root/codeql
RUN codeql --version
RUN codeql query compile codeql-repo/cpp/ql/src/ -j0

# add entrypoint.sh to prepare for dependencies and run analysis
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

