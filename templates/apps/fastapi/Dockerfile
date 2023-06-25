# 파이썬 3.9 버전을 사용하는 베이스 이미지를 가져옵니다. 
FROM python:3.9-alpine

# /code 디렉터리를 WORKDIR로 설정합니다.
WORKDIR /code

# requirements.txt를 /code 디렉터리에 복사합니다.
COPY ./requirements.txt /code/requirements.txt

# pip를 업그레이드하고, requirements.txt에 명시된 파이썬 패키지를 설치합니다.
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 모든 파일을 /code 디렉터리에 복사합니다.
COPY ./ /code/

# main.py를 uvicorn으로 실행합니다.
# 만일 main.py가 아니라 다른 파일을 실행하고 싶다면, 아래의 main:app을 다른 파일명:app으로 변경해주면 됩니다.
# 앱 내에서 uvicorn을 실행하고 있다면 python main.py를 실행하면 됩니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
