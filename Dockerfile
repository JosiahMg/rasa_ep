FROM python:3.8

# 设置国内pip镜像源
COPY pip.conf /root/.pip/pip.conf



WORKDIR /app
COPY . .
COPY ./models /app/models

# 安装依赖
RUN python -m pip install --upgrade pip==21.3.1
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m spacy download zh_core_web_sm
RUN rasa train

# set the user to run, don't run as root
# USER 1001

# set entrypoint for interactive shells
ENTRYPOINT ["rasa"]

CMD ["run", "-m", "/app/models", "--enable-api", "--cors", "*"]
# build : docker build -t mh/rasa3-1.0 .
# run: docker run -it -p 8080:8080 mh/rasa3-1.0