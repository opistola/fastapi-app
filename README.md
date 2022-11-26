# Simple fastapi app

## Setup for local dev

````
python3 -m venv .venv
source .venv/bin/activate
pip install -r src/requirements/local.txt
````

## run local (for dev)

```
uvicorn main:app --reload
```

## run on prod

Load the src/requirements/prod.txt and the pip env

````
uvicorn main:app
````