# RUN
you can run directed:
```shell
pip install -r requirements.txt
rasa train
rasa run --enable-api --cors *
```
or simple way by docker:
```shell
docker build -t rasa_rasa_ep .
docker run -d -p 5005:5005 
# To train model
docker exec <rasa container id> rasa train
```

# Visit
```shell
http://127.0.0.1:5005/webhooks/rest/webhook
```