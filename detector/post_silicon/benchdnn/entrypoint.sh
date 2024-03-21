#!/bin/bash
COMMAND="cd /oneDNN/build/tests/benchdnn/ && ./benchdnn --$DRIVER --mode=p --dt=$DT --batch=inputs/$DRIVER/$BATCH"
echo "$COMMAND"
eval "$COMMAND"
