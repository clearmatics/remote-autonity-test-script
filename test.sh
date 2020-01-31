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

echo "Running TestTendermintSuccess..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintSuccess                    -v -timeout=20m >  ${RESULTS}/success.txt

echo "Running TestTendermintOneMalicious..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintOneMalicious               -v -timeout=20m >  ${RESULTS}/one-malicious.txt

echo "Running TestTendermintSlowConnections..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintSlowConnections            -v -timeout=20m >  ${RESULTS}/slow-connection.txt

echo "Running TestTendermintLongRun..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintLongRun                    -v -timeout=20m >  ${RESULTS}/long-run.txt

echo "Running TestTendermintStopUpToFNodes..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintStopUpToFNodes             -v -timeout=20m >  ${RESULTS}/stop-up-to-f-nodes.txt

echo "Running TestTendermintStartStopSingleNode..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopSingleNode        -v -timeout=20m >  ${RESULTS}/start-stop-single-node.txt

echo "Running TestTendermintStartStopFNodes..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFNodes            -v -timeout=20m >  ${RESULTS}/start-stop-f-nodes.txt

echo "Running TestTendermintStartStopFPlusOneNodes..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFPlusOneNodes     -v -timeout=20m >  ${RESULTS}/start-stop-f-plus-one-nodes.txt

echo "Running TestTendermintStartStopFPlusTwoNodes..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopFPlusTwoNodes     -v -timeout=20m >  ${RESULTS}/start-stop-f-plus-two-nodes.txt

echo "Running TestTendermintStartStopAllNodes..."
go test ${TENDERMINT_TEST}/... -run=TestTendermintStartStopAllNodes          -v -timeout=20m >  ${RESULTS}/start-stop-all-nodes.txt

echo "Running TestCheckBlockWithSmallFee..."
go test ${TENDERMINT_TEST}/... -run=TestCheckBlockWithSmallFee               -v -timeout=20m >  ${RESULTS}/check-block-with-small-fee.txt

echo "Running TestCheckFeeRedirectionAndRedistribution..."
go test ${TENDERMINT_TEST}/... -run=TestCheckFeeRedirectionAndRedistribution -v -timeout=20m >  ${RESULTS}/check-fee-redirection-and-redistribution.txt
