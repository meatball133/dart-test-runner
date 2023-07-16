FROM dart:3-sdk

RUN apt-get update && \
    apt-get install -y jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner/
COPY pubspec.lock pubspec.yaml ./
RUN dart pub get -v
COPY . .
RUN dart compile exe bin/run.dart -o ./bin/testrun
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
