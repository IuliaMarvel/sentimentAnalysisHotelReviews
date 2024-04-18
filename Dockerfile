# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /reviews_project

# Copy the contents of the current directory to the working directory in the container
# COPY requirements.txt /reviews_project/
# COPY utils/ /reviews_project/utils/
# COPY train.py /reviews_project/
# COPY infer.py /reviews_project/
# COPY config/config.yaml /reviews_project/config/
# COPY .dvc/config /reviews_project/.dvc/config
COPY . /reviews_project/

RUN pip install -r /reviews_project/requirements.txt

# RUN dvc pull

# Set environment variables
ENV PYTHONUNBUFFERED=1
# ENV MLFLOW_TRACKING_URI=http://mlflow_server:5000

# Command to run bash in container
CMD ["python",  "train.py"]
