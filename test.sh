
sudo mkdir reports && sudo chmod 777 reports

docker run --shm-size=$ALLOWED_SHARED_MEMORY \
  --user=1001:1001 \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -v reports:/opt/robotframework/reports:Z \
  -v tests:/opt/robotframework/tests:Z \
  -v resources:/opt/robotframework/resources:Z \
  $ROBOT_RUNNER_IMAGE
