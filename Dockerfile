FROM quay.io/bitnami/mysql:8.0.26

ADD run_update.sh /
ADD update.sql /
RUN chmod +x run_update.sh

ENTRYPOINT [ "/run_update.sh" ]
