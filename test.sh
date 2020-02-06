#!/bin/sh

#Assume autonity is under go path
AUTONITY="${HOME}/go/src/github.com/clearmatics/autonity"
TENDERMINT_TEST="${AUTONITY}/consensus/test"
RESULTS="${TENDERMINT_TEST}/test_race_files"

export GORACE="history_size=7"
export GO111MODULE="on"

cd ${AUTONITY}
pwd

if [ ! -d ${RESULTS} ]; then
  mkdir ${RESULTS}
fi

echo "Running Tendermint Tests... writing to tendermint-test.txt"
go test ${TENDERMINT_TEST}/... -v -timeout=120m > ${RESULTS}/tendermint-test.txt
