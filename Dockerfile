FROM node:13-alpine

ENV MONGO_DB_USERNAME=matt \
    MONGO_DB_PWD=eYzYFywsBYP32Hzy \
    DATABASE_URL=mongodb://matt:eYzYFywsBYP32Hzy@mongodb \
    USERNAME=noah \
    PASS=chungus123 \
    USERNAME2=josh \
    PASS2=chungus321 \
    PORT=3000 \
    SENDGRID_API_KEY=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 \
    NODE_ENV=production


RUN mkdir -p /home/app

COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["pm2", "start", "bin/www"]

