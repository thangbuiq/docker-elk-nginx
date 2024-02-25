from fastapi import FastAPI
from datetime import datetime

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/datetime")
def get_current_datetime():
    current_datetime = datetime.now()
    if current_datetime.day < 20:
        return {"error": "Day of month must be greater than or equal to 20"}
    return {"current_datetime": current_datetime}
