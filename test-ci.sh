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

echo "Running TestTendermintSuccess... writing to success-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintSuccess                    -v -timeout=20m >  ${RESULTS}/success-ci.txt

echo "Running TestTendermintOneMalicious... writing to one-malicious-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintOneMalicious               -v -timeout=20m >  ${RESULTS}/one-malicious-ci.txt

echo "Running TestTendermintSlowConnections... writing to slow-connection-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintSlowConnections            -v -timeout=20m >  ${RESULTS}/slow-connection-ci.txt

echo "Running TestTendermintLongRun... writing to long-run-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintLongRun                    -v -timeout=20m >  ${RESULTS}/long-run-ci.txt

echo "Running TestTendermintStopUpToFNodes... writing to stop-up-to-f-nodes-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStopUpToFNodes             -v -timeout=20m >  ${RESULTS}/stop-up-to-f-nodes-ci.txt

echo "Running TestTendermintStartStopSingleNode... writing to start-stop-single-node-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopSingleNode        -v -timeout=20m >  ${RESULTS}/start-stop-single-node-ci.txt

echo "Running TestTendermintStartStopFNodes... writing to start-stop-f-nodes-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFNodes            -v -timeout=20m >  ${RESULTS}/start-stop-f-nodes-ci.txt

echo "Running TestTendermintStartStopFPlusOneNodes... writing to start-stop-f-plus-one-nodes-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFPlusOneNodes     -v -timeout=20m >  ${RESULTS}/start-stop-f-plus-one-nodes-ci.txt

echo "Running TestTendermintStartStopFPlusTwoNodes... writing to start-stop-f-plus-two-nodes-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFPlusTwoNodes     -v -timeout=20m >  ${RESULTS}/start-stop-f-plus-two-nodes-ci.txt

echo "Running TestTendermintStartStopAllNodes... writing to start-stop-all-nodes-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopAllNodes          -v -timeout=20m >  ${RESULTS}/start-stop-all-nodes-ci.txt

echo "Running TestCheckBlockWithSmallFee... writing to check-block-with-small-fee-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestCheckBlockWithSmallFee               -v -timeout=20m >  ${RESULTS}/check-block-with-small-fee-ci.txt

echo "Running TestCheckFeeRedirectionAndRedistribution... writing to check-fee-redirection-and-redistribution-ci.txt"
go test ${TENDERMINT_TEST}/... -run=TestCheckFeeRedirectionAndRedistribution -v -timeout=20m >  ${RESULTS}/check-fee-redirection-and-redistribution-ci.txt
