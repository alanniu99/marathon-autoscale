FROM python:3.4.5-alpine


COPY marathon-autoscale.py requirements.txt /app/
RUN pip3 install -r /app/requirements.txt
CMD ["python", "/app/marathon-autocale.py"]