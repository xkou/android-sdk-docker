
## first

docker run --rm -it   -v /usr/local/adk:/usr/local/adk  xkou/android-sdk:api33-lite init.sh 

## build

docker run --rm -it --name dd -v /root/.gradle:/root/.gradle -v /usr/local/adk:/usr/local/adk  -v $PWD:/root -v/usr/local/node:/usr/local/node xkou/android-sdk:api33-lite ./gradlew