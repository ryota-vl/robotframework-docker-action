# Create reports folder
REPORTS_DIR=$(pwd)/$ROBOT_REPORTS_DIR
TESTS_DIR=$(pwd)/$ROBOT_TESTS_DIR
RESOURCES_DIR=$(pwd)/$ROBOT_RESOURCES_DIR

sudo mkdir $REPORTS_DIR && sudo chmod 777 $REPORTS_DIR && sudo chmod 777 $RESOURCES_DIR

docker run --shm-size=$ALLOWED_SHARED_MEMORY \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -v $REPORTS_DIR:/opt/robotframework/reports:Z \
  -v $TESTS_DIR:/opt/robotframework/tests:Z \
  -v $RESOURCES_DIR:/opt/robotframework/resources:Z \
  --user=1001:1001 \
  $ROBOT_RUNNER_IMAGE
