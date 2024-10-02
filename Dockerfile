FROM ubuntu:latest
LABEL maintainer="Anh Tran <anhb2105662@student.ctu.edu.vn>"

RUN apt update -y && apt install -y python3-pip python3-dev build-essential python3-venv

ADD . /flask_app
WORKDIR /flask_app

RUN python3 -m venv venv
RUN /flask_app/venv/bin/pip3 install --upgrade pip
RUN /flask_app/venv/bin/pip3 install -r requirements.txt

ENV PATH="/flask_app/venv/bin:$PATH"

ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]

