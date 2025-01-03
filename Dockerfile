FROM python:3.12

COPY * /MyBGG/
COPY ./scripts/* /MyBGG/scripts/
COPY ./scripts/mybgg/* /MyBGG/scripts/mybgg/

# Install any needed packages specified in requirements.txt
RUN pip install -r /MyBGG/scripts/requirements.txt
RUN apt-get update && apt-get install -y ffmpeg

CMD cd /MyBGG/ && python /MyBGG/scripts/download_and_index.py --apikey $APIKEY && python -m http.server