from fastapi import FastAPI
import uvicorn
from routers import ftl


app = FastAPI()
app.include_router(ftl.router, prefix="/method")



@app.get("/")
async def root():
    return {"message": "Hello Bigger Applications!"}


uvicorn.run("main:app", host="127.0.0.1", port=5000, log_level="critical")