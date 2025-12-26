# Base image with OCIO + ACES + VFX tools
FROM aswf/ci-vfxall:2022

# Upgrade pip and install Python dependencies only
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --no-cache-dir \
        fastapi==0.104.1 \
        uvicorn[standard]==0.24.0 \
        python-multipart==0.0.6 \
        boto3==1.34.0 \
        Pillow==10.0.0 \
        numpy==1.24.3 \
        opencv-python-headless==4.8.1.78 \
        moviepy==1.0.3 \
        ffmpeg-python==0.2.0 \
        graphviz \
        python-graphviz

# OCIO config path already included in ASWF image
ENV OCIO=/usr/share/ocio/aces_1.3/config.ocio

# Set working directory
WORKDIR /app

# Copy your application code
COPY . .

# Expose FastAPI port
EXPOSE 8000

# Command to run your app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
