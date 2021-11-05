FROM quay.io/bitnami/mysql:8.0.26

ADD run_update.sh /
ADD update.sql /
ADD schemaValidation.sql /
ADD ValidateReadWrite.sql /
ADD generateprewarm.sql /

ENTRYPOINT [ "/bin/bash", "/run_update.sh" ]
