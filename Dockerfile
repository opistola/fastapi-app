FROM python:3.10-alpine as build

RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /code

COPY ./src/requirements.txt /code/requirements.txt

RUN pip install -r /code/requirements.txt

COPY ./src /code/src

FROM python:3.10-alpine as main

WORKDIR /code

COPY --from=build /opt/venv /opt/venv 
COPY src/ /code/src

EXPOSE 80

# Ensure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

#CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]

# If running behind a proxy like Nginx or Traefik add --proxy-headers
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--proxy-headers"]