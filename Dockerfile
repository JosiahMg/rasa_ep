FROM rasa/rasa:3.0.3-full

USER root

WORKDIR /app

COPY . /app

# 安装依赖
# RUN python3 -m pip install --upgrade pip==21.3.1
RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.cloud.tencent.com/pypi/simple/
RUN python3 -m spacy download zh_core_web_sm
# RUN pip install zh_core_web_sm-3.2.0-py3-none-any.whl -i https://mirrors.cloud.tencent.com/pypi/simple/

ENTRYPOINT ["rasa"]
CMD ["run", "-m", "/app/models", "--enable-api", "--cors", "*"]
