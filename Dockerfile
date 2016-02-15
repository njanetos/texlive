# GPLv3
FROM svlentink/texlive-full:latest
MAINTAINER njanetos <nejanetos@gmail.com>
LABEL Description="Personal latex build environment"

RUN apt-get update && \
    apt-get install -y git pdftk poppler-utils wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/github/git-lfs/releases/download/v1.1.1/git-lfs-linux-amd64-1.1.1.tar.gz && \
    tar -xzf git-lfs-linux-amd64-1.1.1.tar.gz && \
    rm git-lfs-linux-amd64-1.1.1.tar.gz && \
    cd git-lfs-1.1.1 && \
    ./install.sh && \
    cd .. && \
    rm -rf git-lfs-1.1.1
    
    
RUN mkdir -p /root/texmf/bibtex/bib && mkdir -p /root/texmf/tex/latex && mkdir .scripts

COPY packages /root/texmf/tex/latex/

COPY citations.bib /root/texmf/bibtex/bib/

COPY .scripts /root/.scripts/
