FROM python:3.8

WORKDIR /app

COPY requirements.txt ./

RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

RUN cp .env.example .env 
RUN python manage.py makemigrations 
RUN python manage.py migrate 

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
