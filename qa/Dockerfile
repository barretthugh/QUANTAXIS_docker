FROM python:3.6.5-jessie

ENV TZ=Asia/Shanghai


COPY entrypoint.sh /entrypoint.sh
# COPY pip.conf /root/.pip/pip.conf   mirror in China
# COPY source.list /etc/apt/sources.list  mirror in China

RUN git clone https://github.com/QUANTAXIS/QUANTAXIS \
  && cd QUANTAXIS \
  && pip install -r requirements.txt \
  && pip install tushare \
  && pip install pytdx \
  && pip install -e . \
  && chmod +x /entrypoint.sh

EXPOSE 8010 8888

ENTRYPOINT ["/entrypoint.sh"]
CMD ["quantaxisd"]
