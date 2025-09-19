cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "SOURCE './keyspace.cql';"

cqlsh --request-timeout=3600 scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.device FROM './device.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.operatoraction FROM './operatoraction.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.sms FROM './sms.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.calculation FROM './calculation.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.confirmcode FROM './confirmcode.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.patch FROM './patch.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.operator FROM './operator.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.incident FROM './incident.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.transaction FROM './transaction.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.simcard FROM './simcard.csv' WITH HEADER=TRUE AND NULL='';"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.countryprice FROM './countryprice.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.country FROM './country.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.partner FROM './partner.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.config FROM './config.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.simcardinit FROM './simcardinit.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.notification FROM './notification.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.partnerlog FROM './partnerlog.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.securityaction FROM './securityaction.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.referraltype FROM './referraltype.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.externalaccount FROM './externalaccount.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.externalactionlog FROM './externalactionlog.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"
sleep 10
cqlsh --request-timeout=3600   scylla-9042.service.dc1.qa.betasms.local -e "COPY sharesmsprod.emailtemplates FROM './emailtemplates.csv' WITH HEADER=TRUE AND NULL='null'  AND NUMPROCESSES=1;"sleep 10
