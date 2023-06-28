FROM python:3.11

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN python3 -m pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

RUN mkdir /code/.cache
RUN chmod 777 /code/.cache
RUN mkdir /code/.chroma
RUN chmod 777 /code/.chroma

CMD ["panel", "serve", "/code/qa-pdf-chatbot.ipynb", "--address", "0.0.0.0", "--port", "7860", "--allow-websocket-origin", "nr-rofiq-qa-pdf-chatbot.hf.space",  "--allow-websocket-origin", "0.0.0.0:7860"]
