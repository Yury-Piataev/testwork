FROM python

RUN mkdir /Flaskex
COPY Flaskex/ /Flaskex
WORKDIR /Flaskex

RUN  pip install --upgrade pip
RUN  pip install -r /Flaskex/requirements.txt

ENTRYPOINT [ "python3", "app.py" ]
