# Simple fastapi app

## Setup for local dev

````
python3 -m venv .venv
source .venv/bin/activate
pip install -r src/requirements.txt
````

## run local (for dev)

```
uvicorn main:app --reload
```

## run on prod

````
uvicorn main:app
````