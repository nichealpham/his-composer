FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

ARG SA_PASSWORD
ENV SA_PASSWORD $SA_PASSWORD

ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

WORKDIR /app
COPY . .

RUN chmod +x /app/init-data.sh
RUN chmod +x /app/entrypoint.sh

CMD /bin/bash /app/entrypoint.sh
