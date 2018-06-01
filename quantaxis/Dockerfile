FROM python:3.6.5-jessie

ENV TZ=Asia/Shanghai

COPY requirement.txt /requirement.txt
# COPY pip.conf /root/.pip/pip.conf  mirror in China
# COPY source.list /etc/apt/sources.list mirror in China

RUN apt-get update \
  && apt install software-properties-common libxml2-dev libxslt-dev -yf \
  && cd / \
  && git clone https://github.com/barretthugh/QUANTAXIS \
  && pip install -r /requirement.txt \
  && pip install tushare \
  && pip install pytdx \
  && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
  && apt-get install -y nodejs \
  && apt-get install npm \
  && npm install npm -g \
  && npm install forever -g \
  && npm install cnpm -g \
  && cd /quantaxis/QUANTAXIS_Webkit/backend \
  && npm install \
  && cd ~/quantaxis/QUANTAXIS_Webkit/web \
  && npm install \
  && cd / \
  && apt-get clean -y \
	&& apt-get autoclean -y \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080
EXPOSE 3000

CMD ["/cmd.sh"]
