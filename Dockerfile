FROM python:3.10-slim

WORKDIR /slr-model

COPY ai-model/ /slr-model/

RUN pip install --upgrade pip \
	&& pip install -r requirements.txt --no-cache-dir
RUN apt-get update \
	&& apt-get install --no-install-recommends ffmpeg libsm6 libxext6 libgl1 -y \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 30000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "30000"]
