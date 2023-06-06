FROM python:3.9

RUN apt-get update && apt-get install -y --no-install-recommends build-essential python3-pip 

RUN pip install --upgrade pip

COPY ./ ./

RUN pip install PyMySQL
RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP=app.py
ENV APP_SETTINGS="config.DevelopmentConfig"

CMD ["flask", "run", "--host=0.0.0.0"]