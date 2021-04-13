FROM python:3

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y davfs2

RUN pip install scipy numpy matplotlib pandas sklearn

COPY run.sh /
COPY dataset_analysis.py /

#ENTRYPOINT [ "/run.sh" ]
