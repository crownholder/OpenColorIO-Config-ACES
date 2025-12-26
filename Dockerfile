FROM aswf/ci-vfxall:2022

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --no-cache-dir \
        fastapi \
        uvicorn[standard] \
        python-multipart \
        boto3 \
        Pillow \
        numpy \
        opencv-python-headless\
        moviepy==1.0.3

ENV OCIO=/usr/share/ocio/aces_1.3/config.ocio

WORKDIR /app
COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]




