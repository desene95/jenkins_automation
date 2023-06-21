JOB_URL=http://localhost:9080/job/test_pipeline
JOB_STATUS_URL=${JOB_URL}/lastBuild/api/json

GREP_RETURN_CODE=0

# Start the build
curl -u admin:11cb4563fe01078c5be0073acacdee1697 $JOB_URL/build?delay=0sec

# Poll every thirty seconds until the build is finished
while [ $GREP_RETURN_CODE -eq 0 ]
do
    sleep 30
    # Grep will return 0 while the build is running:
    curl --silent $JOB_STATUS_URL | grep result\":null > /dev/null
    GREP_RETURN_CODE=$?
done

echo Build finished