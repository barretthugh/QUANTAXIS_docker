FROM python:3.6.5-jessie

ENV TZ=Asia/Shanghai


COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt
COPY jupyter_notebook_config.py /root/.jupyter/
# COPY pip.conf /root/.pip/pip.conf   mirror in China
# COPY source.list /etc/apt/sources.list  mirror in China

RUN apt-get update \
  && apt-get install -y wget \
  && cd / \
  && wget https://downloads.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz \
	&& tar xvf ta-lib-0.4.0-src.tar.gz \
	&& cd ta-lib \
	&& ./configure --prefix=/usr \
	&& make \
	&& make install \
  && cd .. \
	&& rm -rf ta-lib \
	&& rm ta-lib-0.4.0-src.tar.gz \
	&& curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb \
	&& dpkg -i /chrome.deb || apt-get install -yf \
	&& rm /chrome.deb \
	&& curl https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip -o /usr/local/bin/chromedriver.zip \
	&& apt-get install unzip \
	&& unzip /usr/local/bin/chromedriver.zip \
	&& mv /chromedriver /usr/local/bin/ \
	&& rm /usr/local/bin/chromedriver.zip \
	&& chmod +x /usr/local/bin/chromedriver \
  && git clone https://github.com/QUANTAXIS/QUANTAXIS \
  && git clone https://github.com/barretthugh/nstools \
  && pip install -r /requirements.txt \
  && cd QUANTAXIS \
  && pip install -r requirements.txt \
  && pip install tushare \
  && pip install pytdx \
  && pip install -e . \
  && chmod +x /entrypoint.sh
  && pip uninstall prompt-toolkit -y \
  && pip install prompt-toolkit \
  && jupyter nbextension enable --py widgetsnbextension \
  && jupyter serverextension enable --py jupyterlab

EXPOSE 8010 8888

ENTRYPOINT ["/entrypoint.sh"]
CMD ["jupyter", "lab", "--allow-root"]
#CMD ["quantaxisd"]
