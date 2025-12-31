FROM python:3.11-slim
WORKDIR /app
COPY . /app
RUN pip install -e ".[dev]"
CMD ["python", "-c", "from src.app import add; print(add(2,3))"]
