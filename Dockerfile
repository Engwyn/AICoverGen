FROM python:3.9.18

# Install dependencies
RUN apt -y update && apt install -y git ffmpeg sox

# Create a directory in the image
RUN mkdir -p /app/AICoverGen

# Copy the local source code and files into the image
COPY . /app/AICoverGen
WORKDIR /app/AICoverGen

# Install requirements
RUN pip install -r requirements.txt

# Download required models
RUN python src/download_models.py

# Run the webui
CMD ["python", "src/webui.py", "--listen"]
