FROM python:bullseye

ARG userUID=1000

RUN  DEBIAN_FRONTEND=noninteractive apt update && apt install -y ffmpeg

RUN useradd -m -u $userUID zotify_usr
USER zotify_usr

WORKDIR /home/zotify_usr

COPY requirements.txt .
COPY zotify ./zotify

RUN pip install -r ~/requirements.txt
RUN mkdir ./tmp ./songs

CMD ["python3", "-m", "zotify"]
