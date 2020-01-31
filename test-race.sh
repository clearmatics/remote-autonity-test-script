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

echo "Running TestTendermintSuccess with race flag... writing to success-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintSuccess                    -v -race -timeout=120m >  ${RESULTS}/success-race.txt

echo "Running TestTendermintOneMalicious with race flag... writing to one-malicious-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintOneMalicious               -v -race -timeout=120m >  ${RESULTS}/one-malicious-race.txt

echo "Running TestTendermintSlowConnections with race flag... writing to slow-connection-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintSlowConnections            -v -race -timeout=120m >  ${RESULTS}/slow-connection-race.txt

echo "Running TestTendermintLongRun with race flag... writing to long-run-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintLongRun                    -v -race -timeout=120m >  ${RESULTS}/long-run-race.txt

echo "Running TestTendermintStopUpToFNodes with race flag... writing to stop-up-to-f-nodes-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStopUpToFNodes             -v -race -timeout=120m >  ${RESULTS}/stop-up-to-f-nodes-race.txt

echo "Running TestTendermintStartStopSingleNode with race flag... writing to start-stop-single-node-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopSingleNode        -v -race -timeout=120m >  ${RESULTS}/start-stop-single-node-race.txt

echo "Running TestTendermintStartStopFNodes with race flag... writing to start-stop-f-nodes-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFNodes            -v -race -timeout=120m >  ${RESULTS}/start-stop-f-nodes-race.txt

echo "Running TestTendermintStartStopFPlusOneNodes with race flag... writing to start-stop-f-plus-one-nodes-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFPlusOneNodes     -v -race -timeout=120m >  ${RESULTS}/start-stop-f-plus-one-nodes-race.txt

echo "Running TestTendermintStartStopFPlusTwoNodes with race flag... writing to start-stop-f-plus-two-nodes-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFPlusTwoNodes     -v -race -timeout=120m >  ${RESULTS}/start-stop-f-plus-two-nodes-race.txt

echo "Running TestTendermintStartStopAllNodes with race flag... writing to start-stop-all-nodes-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopAllNodes          -v -race -timeout=120m >  ${RESULTS}/start-stop-all-nodes-race.txt

echo "Running TestCheckBlockWithSmallFee with race flag... writing to check-block-with-small-fee-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestCheckBlockWithSmallFee               -v -race -timeout=120m >  ${RESULTS}/check-block-with-small-fee-race.txt

echo "Running TestCheckFeeRedirectionAndRedistribution with race flag... writing to check-fee-redirection-and-redistribution-race.txt"
go test ${TENDERMINT_TEST}/... -run=TestCheckFeeRedirectionAndRedistribution -v -race -timeout=120m >  ${RESULTS}/check-fee-redirection-and-redistribution-race.txt

echo "Running Tendermint Tests... writing to tendermint-test.txt"
go test ${TENDERMINT_TEST}/... -v -timeout=120m > ${RESULTS}/tendermint-test.txt
