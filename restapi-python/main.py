from typing import Optional

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods="GET",
    allow_headers=["*"]
)

class Product():
    def __init__(self, id, title, category):
         self.id = id
         self.title = title
         self.category = category

products = [ 
    Product(1, "Serverless Containers", "Разработчики"),
    Product(2, "Cloud Functions", "Разработчики"),
    Product(3, "API Gateway", "Разработчики"),
    Product(4, "Object Storage", "Разработчики"),
]

@app.get("/")
def read_root():
    return {"Python Sample API powered by Serverless Contaienrs"}


@app.get("/products")
def get_products():
    return products
