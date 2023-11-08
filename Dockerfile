# Use a specific version of the base image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Create a non-root user
RUN useradd -m dev
USER dev

# Copy requirements and install them
COPY --chown=dev:dev ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the application code
COPY --chown=dev:dev ./app /app/app
EXPOSE 80
# Expose a different port (e.g., 8000)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
