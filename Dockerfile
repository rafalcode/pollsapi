FROM python:3.6
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y dist-upgrade \
    && apt-get install -y default-mysql-client cron \
      bind9-host vim-nox strace telnet supervisor ntp
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN pip install -r requirements.txt

EXPOSE 8000

# ENTRYPOINT [ "./manage.py runserver 8000" ]
