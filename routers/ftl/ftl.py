from fastapi import APIRouter

router = APIRouter(
    prefix="/ftl.",
    tags=["ftl"]
)


@router.get("test")
async def test_method():
    return {"ping": "pong2"}
